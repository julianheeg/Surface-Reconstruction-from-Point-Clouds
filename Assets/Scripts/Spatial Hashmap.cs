using Priority_Queue;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;
using Accord.Math;
using Vector3 = UnityEngine.Vector3;
using Accord.Math.Decompositions;
using System.Threading;

/// <summary>
/// A data structure for storing points in space and calculating distances.
/// It partitions the space inside the bounding box into buckets where the points are held in a list.
/// </summary>
public class SpatialHashmap {

#pragma warning disable 0414
    //bounding box of all points
    public static float xMin, xMax, xRange;
    public static float yMin, yMax, yRange;
    public static float zMin, zMax, zRange;
#pragma warning restore
    float diagonalLength;

    float delta = 0f;
    float rho = 0f;
    int neighborConsideredForRho; //rho is set to be the largest distance to an n-th neighbor. this choice is somewhat arbitrary. it is set to 20 at max in the constructor 
    public float RhoPlusDelta { get; private set; }

    //size of buckets
    static float bucketSize;
    Dictionary<Cube, PointBucket> pointBuckets;
    Dictionary<Cube, TangentPlaneBucket> planeBuckets;

    //the plane with the largest z value. Used to orient the tangent planes, and later to start the marching cubes triangulation
    public TangentPlane tangentPlaneWithLargestZ = new TangentPlane(Vector3.negativeInfinity, Vector3.zero, false);

    //the number of points currently stored in this data structure
    public int Count { get; private set; }

    #region setup
    //----------------------------------------------------------------Setup--------------------------------------------------------------------------


    /// <summary>
    /// constructs a spatial hashmap with the given min and max values for the bounding box
    /// </summary>
    /// <param name="xMin"></param>
    /// <param name="xMax"></param>
    /// <param name="yMin"></param>
    /// <param name="yMax"></param>
    /// <param name="zMin"></param>
    /// <param name="zMax"></param>
    public SpatialHashmap(float xMin, float xMax, float yMin, float yMax, float zMin, float zMax)
    {
        neighborConsideredForRho = Math.Min(Controller.consideredNeighbors - 1, 20);

        pointBuckets = new Dictionary<Cube, PointBucket>();
        planeBuckets = new Dictionary<Cube, TangentPlaneBucket>();
        SpatialHashmap.xMin = xMin;
        SpatialHashmap.xMax = xMax;
        SpatialHashmap.yMin = yMin;
        SpatialHashmap.yMax = yMax;
        SpatialHashmap.zMin = zMin;
        SpatialHashmap.zMax = zMax;
        
        CalculateBucketSize();
    }

    /// <summary>
    ///   calculates the dimensions of the buckets. This is done in a way so that
    ///   there are as many buckets in the biggest dimension as is specified in the
    ///   config. The other dimensions are then set so that the buckets are roughly
    ///   cube shaped.
    /// </summary>
    /// <param name="xMin"></param>
    /// <param name="xMax"></param>
    /// <param name="yMin"></param>
    /// <param name="yMax"></param>
    /// <param name="zMin"></param>
    /// <param name="zMax"></param>
    private void CalculateBucketSize()
    {
        xRange = xMax - xMin;
        yRange = yMax - yMin;
        zRange = zMax - zMin;

        float maxRange = Math.Max(xRange, Math.Max(yRange, zRange));
        bucketSize = maxRange / Controller.maxPartitions;

        diagonalLength = (float)Math.Sqrt(xRange * xRange + yRange * yRange + zRange * zRange);
    }

    /// <summary>
    /// a helper function which saves a bit of writing code.
    /// It sets the bucket size in one dimension
    /// </summary>
    /// <param name="bucketMaxDimensionSize">the bucket size in the widest dimension</param>
    /// <param name="dimensionDistance">the width in the dimension that is set here</param>
    /// <param name="bucketDimensionSize">a reference to the size of the bucket in this dimension</param>
    static void SetBucketSizeInDimension(float bucketMaxDimensionSize, float dimensionDistance, ref float bucketDimensionSize)
    {
        float dimensionBuckets = (float)Math.Ceiling(dimensionDistance / bucketMaxDimensionSize);
        bucketDimensionSize = dimensionDistance / dimensionBuckets;
    }
    #endregion


    #region insertion
    //------------------------------------------------------------Insertion--------------------------------------------------------------------------

    /// <summary>
    ///     inserts a point into the data structure. If it falls into a bucket
    ///     that doesn't yet exist, a new one gets created for it.
    /// </summary>
    /// <param name="point"></param>
    public void Insert(Vector3 point)
    {
        Cube hash = Hash(point);

        //put in bucket or create one
        PointBucket bucket;

        if (pointBuckets.TryGetValue(hash, out bucket))
        {
            bucket.Add(point);
        }
        else
        {
            bucket = new PointBucket(point);
            pointBuckets.Add(hash, bucket);
        }

        //increase number of points stored
        Count++;
    }


    /// <summary>
    ///     inserts a plane into the data structure. If the center falls into a bucket
    ///     that doesn't yet exist, a new one gets created for it.
    /// </summary>
    /// <param name="plane"></param>
    public void Insert(TangentPlane plane)
    {
        Cube hash = Hash(plane.center);

        //compare to plane with largest z
        if (tangentPlaneWithLargestZ.center.z < plane.center.z)
        {
            //Extension.Log("Tangent plane with largest z is set anew, center: " + tangentPlaneWithLargestZ.center);
            tangentPlaneWithLargestZ = plane;
        }

        TangentPlaneBucket bucket;

        if (planeBuckets.TryGetValue(hash, out bucket))
        {
            bucket.Add(plane);
        }
        else
        {
            bucket = new TangentPlaneBucket(plane);
            planeBuckets.Add(hash, bucket);
        }
    }
    #endregion


    #region Point Hashing
    /// <summary>
    /// calculates a hash value for a point
    /// </summary>
    /// <param name="point">the point to hash</param>
    /// <returns></returns>
    private static Cube Hash(Vector3 point)
    {
        int xBucket, yBucket, zBucket;
        GetBucketIndices(point, out xBucket, out yBucket, out zBucket);
        return new Cube(xBucket, yBucket, zBucket);
    }

    /// <summary>
    /// calculates the bucket indices of a point
    /// </summary>
    /// <param name="point"></param>
    /// <param name="xBucket"></param>
    /// <param name="yBucket"></param>
    /// <param name="zBucket"></param>
    private static void GetBucketIndices(Vector3 point, out int xBucket, out int yBucket, out int zBucket)
    {
        xBucket = (int)((point.x - xMin) / bucketSize);
        yBucket = (int)((point.y - yMin) / bucketSize);
        zBucket = (int)((point.z - zMin) / bucketSize);
    }

    #endregion


    #region utility functions


    ///// <summary>
    ///// calculates the nearest neighbors of a point in space
    ///// </summary>
    ///// <param name="point">the point whose neighbors to calculate</param>
    ///// <param name="number">how many nearest neighbors should be returned</param>
    ///// <returns>an array of the nearest neighbors</returns>
    //public Vector3[] NearestNeighborPoints(Vector3 point, int number)
    //{
    //    if (number > Count)
    //    {
    //        throw new ArgumentOutOfRangeException("SpatialHashmap.NearestNeighborPoints(): The amount of neighbors requested is "
    //            + number + ", but there are only " + Count + " points in the collection");
    //    }

    //    // the idea of this section is described in detail in chapter 3 of the thesis

    //    SimplePriorityQueue<Vector3> possibleNearestNeighbors = new SimplePriorityQueue<Vector3>();
    //    Stack<Cube> neighborCubeStack = new Stack<Cube>();
    //    HashSet<Cube> visitedSet = new HashSet<Cube>();

    //    int currentRadius = 0;
    //    int additionalIterations = 0;

    //    do
    //    {
    //        if (possibleNearestNeighbors.Count >= number)
    //        {
    //            additionalIterations++;
    //        }

    //        Vector3 pointInInitialCube = point + currentRadius * bucketSize * Vector3.right;
    //        int initialXBucket, initialYBucket, initialZBucket;
    //        GetBucketIndices(pointInInitialCube, out initialXBucket, out initialYBucket, out initialZBucket);
    //        neighborCubeStack.Push(new Cube(initialXBucket, initialYBucket, initialZBucket));

    //        while (neighborCubeStack.Count > 0)
    //        {
    //            Cube currentCube = neighborCubeStack.Pop();
    //            PointBucket pointBucket;
    //            if (pointBuckets.TryGetValue(currentCube, out pointBucket))
    //            {
    //                pointBucket.GatherPoints(point, possibleNearestNeighbors);
    //            }
    //            Cube[] currentNeighbors = currentCube.IntersectedNeighborCubes(point, currentRadius);
    //            foreach (Cube neighborCube in currentNeighbors)
    //            {
    //                if (!visitedSet.Contains(neighborCube))
    //                {
    //                    visitedSet.Add(neighborCube);
    //                    neighborCubeStack.Push(neighborCube);
    //                }
    //            }
    //        }

    //        currentRadius++;
    //    } while (additionalIterations != 2);

    //    //build actual neighbors array
    //    Vector3[] neighbors = new Vector3[number];
    //    for (int i = 0; i < number; i++)
    //    {
    //        neighbors[i] = possibleNearestNeighbors.Dequeue();
    //    }

    //    return neighbors;
    //}

    /// <summary>
    /// calculates the nearest neighbors of a point in space
    /// </summary>
    /// <param name="point">the point whose neighbors to calculate</param>
    /// <param name="number">how many nearest neighbors should be returned</param>
    /// <returns>an array of the nearest neighbors</returns>
    public Vector3[] NearestNeighborPoints(Vector3 point, int number)
    {
        if (number > Count)
        {
            throw new ArgumentOutOfRangeException("SpatialHashmap.NearestNeighborPoints(): The amount of neighbors requested is "
                + number + ", but there are only " + Count + " points in the collection");
        }

        // the idea of this section is described in detail in chapter 3 of the thesis

        SimplePriorityQueue<Vector3> possibleNearestNeighbors = new SimplePriorityQueue<Vector3>();

        int currentRadius = 0;
        int additionalIterations = 0;

        do
        {
            if (possibleNearestNeighbors.Count >= number)
            {
                additionalIterations++;
            }

            int initialXBucket, initialYBucket, initialZBucket;
            GetBucketIndices(point, out initialXBucket, out initialYBucket, out initialZBucket);

            //loop over all cubes in a cube with the current radius
            for (int i = initialXBucket - currentRadius; i <= initialXBucket + currentRadius; i++)
            {
                for (int j = initialYBucket - currentRadius; j <= initialYBucket + currentRadius; j++)
                {
                    for (int k = initialZBucket - currentRadius; k <= initialZBucket + currentRadius; k++)
                    {
                        Cube cubeToCheck = new Cube(i, j, k);
                        //check intersection
                        if (cubeToCheck.isIntersected(point, currentRadius))
                        {
                            PointBucket pointBucket;
                            if (pointBuckets.TryGetValue(cubeToCheck, out pointBucket))
                            {
                                pointBucket.GatherPoints(point, possibleNearestNeighbors);
                            }
                        }
                    }
                }
            }

            currentRadius++;
        } while (additionalIterations != 2);

        //build actual neighbors array
        Vector3[] neighbors = new Vector3[number];
        for (int i = 0; i < number; i++)
        {
            neighbors[i] = possibleNearestNeighbors.Dequeue();
        }

        return neighbors;
    }


    ///// <summary>
    ///// calculates the nearest neighbors of a tangent plane
    ///// </summary>
    ///// <param name="plane">the plane whose neighbors to calculate</param>
    ///// <param name="number">how many nearest neighbors should be returned</param>
    ///// <returns>an array of the nearest neighbors</returns>
    //public TangentPlane[] NearestNeighborPlanes(TangentPlane plane, int number)
    //{
    //    if (number > Count)
    //    {
    //        throw new ArgumentOutOfRangeException("SpatialHashmap.NearestNeighborPoints(): The amount of neighbors requested is "
    //            + number + ", but there are only " + Count + " points in the collection");
    //    }

    //    // the idea of this section is described in detail in chapter 3 of the thesis

    //    SimplePriorityQueue<TangentPlane> possibleNearestNeighbors = new SimplePriorityQueue<TangentPlane>();
    //    Stack<Cube> neighborCubeStack = new Stack<Cube>();
    //    HashSet<Cube> visitedSet = new HashSet<Cube>();

    //    int currentRadius = 0;
    //    int additionalIterations = 0;

    //    do
    //    {
    //        if (possibleNearestNeighbors.Count >= number)
    //        {
    //            additionalIterations++;
    //        }

    //        Vector3 pointInInitialCube = plane.center + currentRadius * bucketSize * Vector3.right;
    //        int initialXBucket, initialYBucket, initialZBucket;
    //        GetBucketIndices(pointInInitialCube, out initialXBucket, out initialYBucket, out initialZBucket);
    //        neighborCubeStack.Push(new Cube(initialXBucket, initialYBucket, initialZBucket));

    //        while (neighborCubeStack.Count > 0)
    //        {
    //            Cube currentCube = neighborCubeStack.Pop();
    //            TangentPlaneBucket planeBucket;
    //            if (planeBuckets.TryGetValue(currentCube, out planeBucket))
    //            {
    //                planeBucket.GatherPoints(plane.center, possibleNearestNeighbors);
    //            }
    //            Cube[] currentNeighbors = currentCube.IntersectedNeighborCubes(plane.center, currentRadius);
    //            foreach (Cube neighborCube in currentNeighbors)
    //            {
    //                if (!visitedSet.Contains(neighborCube))
    //                {
    //                    visitedSet.Add(neighborCube);
    //                    neighborCubeStack.Push(neighborCube);
    //                }
    //            }
    //        }

    //        currentRadius++;
    //    } while (additionalIterations != 2);

    //    //build actual neighbors array
    //    TangentPlane[] neighbors = new TangentPlane[number];
    //    for (int i = 0; i < number; i++)
    //    {
    //        neighbors[i] = possibleNearestNeighbors.Dequeue();
    //    }

    //    return neighbors;
    //}

    /// <summary>
    /// calculates the nearest neighbors of a tangent plane
    /// </summary>
    /// <param name="plane">the plane whose neighbors to calculate</param>
    /// <param name="number">how many nearest neighbors should be returned</param>
    /// <returns>an array of the nearest neighbors</returns>
    public TangentPlane[] NearestNeighborPlanes(TangentPlane plane, int number)
    {
        if (number > Count)
        {
            throw new ArgumentOutOfRangeException("SpatialHashmap.NearestNeighborPoints(): The amount of neighbors requested is "
                + number + ", but there are only " + Count + " points in the collection");
        }

        // the idea of this section is described in detail in chapter 3 of the thesis

        SimplePriorityQueue<TangentPlane> possibleNearestNeighbors = new SimplePriorityQueue<TangentPlane>();

        int currentRadius = 0;
        int additionalIterations = 0;

        do
        {
            if (possibleNearestNeighbors.Count >= number)
            {
                additionalIterations++;
            }

            int initialXBucket, initialYBucket, initialZBucket;
            GetBucketIndices(plane.center, out initialXBucket, out initialYBucket, out initialZBucket);

            //loop over all cubes in a cube with the current radius
            for (int i = initialXBucket - currentRadius; i <= initialXBucket + currentRadius; i++)
            {
                for (int j = initialYBucket - currentRadius; j <= initialYBucket + currentRadius; j++)
                {
                    for (int k = initialZBucket - currentRadius; k <= initialZBucket + currentRadius; k++)
                    {
                        Cube cubeToCheck = new Cube(i, j, k);
                        //check intersection
                        if (cubeToCheck.isIntersected(plane.center, currentRadius))
                        {
                            TangentPlaneBucket planeBucket;
                            if (planeBuckets.TryGetValue(cubeToCheck, out planeBucket))
                            {
                                planeBucket.GatherPoints(plane.center, possibleNearestNeighbors);
                            }
                        }
                    }
                }
            }

            currentRadius++;
        } while (additionalIterations != 2);

        //build actual neighbors array. Omit the first tangent plane because it is not its own neighbor
        TangentPlane[] neighbors = new TangentPlane[number];
        for (int i = 0; i < number; i++)
        {
            neighbors[i] = possibleNearestNeighbors.Dequeue();
        }

        return neighbors;
    }

    ///// <summary>
    ///// calculates the nearest tangent plane of a point in space
    ///// </summary>
    ///// <param name="point">the point whose nearest tangent plane to calculate</param>
    ///// <returns>the nearest tangent plane</returns>
    //public TangentPlane NearestOneTangentPlane(Vector3 point)
    //{
    //    // the idea of this section is described in detail in chapter 3 of the thesis.
    //    // only difference: only one plane is requested, so only one plane will be stored in a variable

    //    TangentPlane nearestPlane = null;
    //    float minDistance = float.PositiveInfinity;
    //    Stack<Cube> neighborCubeStack = new Stack<Cube>();
    //    HashSet<Cube> visitedSet = new HashSet<Cube>();

    //    int currentRadius = 0;
    //    int additionalIterations = 0;

    //    do
    //    {
    //        if (nearestPlane != null)
    //        {
    //            additionalIterations++;
    //        }

    //        Vector3 pointInInitialCube = point + currentRadius * bucketSize * Vector3.right;
    //        int initialXBucket, initialYBucket, initialZBucket;
    //        GetBucketIndices(pointInInitialCube, out initialXBucket, out initialYBucket, out initialZBucket);
    //        neighborCubeStack.Push(new Cube(initialXBucket, initialYBucket, initialZBucket));

    //        while (neighborCubeStack.Count > 0)
    //        {
    //            Cube currentCube = neighborCubeStack.Pop();
    //            float currentDistance;
    //            TangentPlaneBucket planeBucket;
    //            if (planeBuckets.TryGetValue(currentCube, out planeBucket))
    //            {
    //                TangentPlane planeWithMinDistanceFromCurrentBucket = planeBucket.GetMinDistance(point, out currentDistance);
    //                if (currentDistance < minDistance)
    //                {
    //                    minDistance = currentDistance;
    //                    nearestPlane = planeWithMinDistanceFromCurrentBucket;
    //                }
    //            }
    //            Cube[] currentNeighbors = currentCube.IntersectedNeighborCubes(point, currentRadius);
    //            foreach (Cube neighborCube in currentNeighbors)
    //            {
    //                if (!visitedSet.Contains(neighborCube))
    //                {
    //                    visitedSet.Add(neighborCube);
    //                    neighborCubeStack.Push(neighborCube);
    //                }
    //            }
    //        }

    //        currentRadius++;
    //    } while (additionalIterations != 2);

    //    return nearestPlane;
    //}

    /// <summary>
    /// calculates the nearest tangent plane of a point in space
    /// </summary>
    /// <param name="point">the point whose nearest tangent plane to calculate</param>
    /// <returns>the nearest tangent plane</returns>
    public TangentPlane NearestOneTangentPlane(Vector3 point)
    {
        // the idea of this section is described in detail in chapter 3 of the thesis.
        // only difference: only one plane is requested, so only one plane will be stored in a variable

        TangentPlane nearestPlane = null;
        float minDistance = float.PositiveInfinity;

        int currentRadius = 0;
        int additionalIterations = 0;

        do
        {
            if (nearestPlane != null)
            {
                additionalIterations++;
            }

            int initialXBucket, initialYBucket, initialZBucket;
            GetBucketIndices(point, out initialXBucket, out initialYBucket, out initialZBucket);

            //loop over all cubes in a cube with the current radius
            for (int i = initialXBucket - currentRadius; i <= initialXBucket + currentRadius; i++)
            {
                for (int j = initialYBucket - currentRadius; j <= initialYBucket + currentRadius; j++)
                {
                    for (int k = initialZBucket - currentRadius; k <= initialZBucket + currentRadius; k++)
                    {
                        Cube cubeToCheck = new Cube(i, j, k);
                        //check intersection
                        if (cubeToCheck.isIntersected(point, currentRadius))
                        {
                            TangentPlaneBucket planeBucket;
                            if (planeBuckets.TryGetValue(cubeToCheck, out planeBucket))
                            {
                                float currentDistance;
                                TangentPlane planeWithMinDistanceFromCurrentBucket = planeBucket.GetMinDistance(point, out currentDistance);
                                if (currentDistance < minDistance)
                                {
                                    minDistance = currentDistance;
                                    nearestPlane = planeWithMinDistanceFromCurrentBucket;
                                }
                            }
                        }
                    }
                }
            }

            currentRadius++;
        } while (additionalIterations != 2);

        return nearestPlane;
    }


    ///// <summary>
    ///// checks whether there is a sample point in a given ball around a given point
    ///// </summary>
    ///// <param name="point">the center of the ball</param>
    ///// <returns>true if there is a sample point within the ball, false otherwise</returns>
    //public bool IsThereSamplePointInBall(Vector3 point)
    //{
    //    //fast check for points that are outside of the bounding box
    //    if (point.x < xMin - RhoPlusDelta
    //        || point.x > xMax + RhoPlusDelta
    //        || point.y < yMin - RhoPlusDelta
    //        || point.y > yMax + RhoPlusDelta
    //        || point.z < zMin - RhoPlusDelta
    //        || point.z > zMax + RhoPlusDelta)
    //    {
    //        return false;
    //    }

    //    //same idea as in the three functions before

    //    Stack<Cube> neighborCubeStack = new Stack<Cube>();
    //    HashSet<Cube> visitedSet = new HashSet<Cube>();

    //    int currentRadius = 0;
    //    int additionalIterations = 0;

    //    do
    //    {
    //        if ((float)currentRadius * bucketSize > RhoPlusDelta)
    //        {
    //            additionalIterations++;
    //        }

    //        Vector3 pointInInitialCube = point + currentRadius * bucketSize * Vector3.right;
    //        int initialXBucket, initialYBucket, initialZBucket;
    //        GetBucketIndices(pointInInitialCube, out initialXBucket, out initialYBucket, out initialZBucket);
    //        neighborCubeStack.Push(new Cube(initialXBucket, initialYBucket, initialZBucket));

    //        while (neighborCubeStack.Count > 0)
    //        {
    //            Cube currentCube = neighborCubeStack.Pop();
    //            PointBucket pointBucket;
    //            if (pointBuckets.TryGetValue(currentCube, out pointBucket) && pointBucket.IsClosestPointInBall(point, RhoPlusDelta))
    //            {
    //                return true;                   
    //            }
    //            Cube[] currentNeighbors = currentCube.IntersectedNeighborCubes(point, currentRadius);
    //            foreach (Cube neighborCube in currentNeighbors)
    //            {
    //                if (!visitedSet.Contains(neighborCube))
    //                {
    //                    visitedSet.Add(neighborCube);
    //                    neighborCubeStack.Push(neighborCube);
    //                }
    //            }
    //        }

    //        currentRadius++;
    //    } while (additionalIterations != 2);

    //    return false;
    //}

    /// <summary>
    /// checks whether there is a sample point in a given ball around a given point
    /// </summary>
    /// <param name="point">the center of the ball</param>
    /// <returns>true if there is a sample point within the ball, false otherwise</returns>
    public bool IsThereSamplePointInBall(Vector3 point)
    {
        //fast check for points that are outside of the bounding box
        if (point.x < xMin - RhoPlusDelta
            || point.x > xMax + RhoPlusDelta
            || point.y < yMin - RhoPlusDelta
            || point.y > yMax + RhoPlusDelta
            || point.z < zMin - RhoPlusDelta
            || point.z > zMax + RhoPlusDelta)
        {
            return false;
        }

        //same idea as in the three functions before

        int currentRadius = 0;
        int additionalIterations = 0;

        do
        {
            if ((float)currentRadius * bucketSize > RhoPlusDelta)
            {
                additionalIterations++;
            }

            int initialXBucket, initialYBucket, initialZBucket;
            GetBucketIndices(point, out initialXBucket, out initialYBucket, out initialZBucket);

            //loop over all cubes in a cube with the current radius
            for (int i = initialXBucket - currentRadius; i <= initialXBucket + currentRadius; i++)
            {
                for (int j = initialYBucket - currentRadius; j <= initialYBucket + currentRadius; j++)
                {
                    for (int k = initialZBucket - currentRadius; k <= initialZBucket + currentRadius; k++)
                    {
                        Cube cubeToCheck = new Cube(i, j, k);
                        //check intersection
                        if (cubeToCheck.isIntersected(point, currentRadius))
                        {
                            PointBucket pointBucket;
                            if (pointBuckets.TryGetValue(cubeToCheck, out pointBucket) && pointBucket.IsClosestPointInBall(point, RhoPlusDelta))
                            {
                                return true;                   
                            }
                        }
                    }
                }
            }

            currentRadius++;
        } while (additionalIterations != 2);

        return false;
    }

    /// <summary>
    /// calculates the signed distance between a point and the implicitly defined surface
    /// </summary>
    /// <param name="point">the point in space whose distance to calculate</param>
    /// <returns>a signed distance if the point is within the rho+delta ball of a sample point and null otherwise</returns>
    public float? Distance(Vector3 point)
    {
        //Bug workaround. This checks if the point is too far from the bounding
        //box in which case no value would be reported.
        //Without this section an infinite amount of intersections could be
        //reported along a voronoy face causing the program to loop infinitely.
        //The cause for this is the use of the regular distance function along
        //with Marching Cubes. Fixing either one would make this check unnecessary.
        if (point.x < xMin - 2 * RhoPlusDelta
            || point.x > xMax + 2 * RhoPlusDelta
            || point.y < yMin - 2 * RhoPlusDelta
            || point.y > yMax + 2 * RhoPlusDelta
            || point.z < zMin - 2 * RhoPlusDelta
            || point.z > zMax + 2 * RhoPlusDelta)
        {
            return null;
        }

        TangentPlane nearestPlane = NearestOneTangentPlane(point);
        Vector3 z = point - Vector3.Dot(point - nearestPlane.center, nearestPlane.normal) * nearestPlane.normal;
        if (IsThereSamplePointInBall(z))
        {
            return Vector3.Dot(point - nearestPlane.center, nearestPlane.normal);
        }
        else
        {
            return null;
        }
    }

    #region Cube
    struct Cube
    {
        static readonly int[] negXFace = new int[] { 0, 1, 2, 3 };
        static readonly int[] posXFace = new int[] { 4, 5, 6, 7 };
        static readonly int[] negYFace = new int[] { 0, 1, 4, 5 };
        static readonly int[] posYFace = new int[] { 2, 3, 6, 7 };
        static readonly int[] negZFace = new int[] { 0, 2, 4, 6 };
        static readonly int[] posZFace = new int[] { 1, 3, 5, 7 };

        readonly int xBucket, yBucket, zBucket;

        public Cube(int xBucket, int yBucket, int zBucket)
        {
            this.xBucket = xBucket;
            this.yBucket = yBucket;
            this.zBucket = zBucket;
        }

        /// <summary>
        /// calculates the neighbors of this cube that are intersected by a sphere
        /// </summary>
        /// <param name="point">the middle of the sphere</param>
        /// <param name="radius">the radius of the sphere</param>
        /// <returns></returns>
        public Cube[] IntersectedNeighborCubes(Vector3 point, int radius)
        {
            //if radius is 0, do nothing
            if (radius == 0)
            {
                return new Cube[0];
            }
            float scaledRadius = radius * bucketSize;

            //else calculate neighbors
            //indexed by xyz with 0 being the lesser value and 1 being the greater value. example: 101 is corner with greater x, lesser y, greater z
            float[] cornerValues = new float[8];
            CalculateCornerValues(point, cornerValues);
            List<Cube> intersections = CalculateIntersectionsFromCorners(scaledRadius, cornerValues);

            //check for special cases
            int pointXBucket;
            int pointYBucket;
            int pointZBucket;
            SpatialHashmap.GetBucketIndices(point, out pointXBucket, out pointYBucket, out pointZBucket);

            CalculateNeighborsFromSpecialCases_Faces(point, scaledRadius, cornerValues, intersections, pointXBucket, pointYBucket, pointZBucket);
            CalculateNeighborsFromSpecialCases_Edges(point, scaledRadius, cornerValues, intersections, pointXBucket, pointYBucket, pointZBucket);

            return intersections.ToArray();
        }

        private void CalculateNeighborsFromSpecialCases_Edges(Vector3 point, float radius, float[] cornerValues, List<Cube> intersections, int pointXBucket, int pointYBucket, int pointZBucket)
        {
            //if this lies in the same x plane
            if (pointXBucket == xBucket)
            {
                //negative y face
                if (pointYBucket >= yBucket)
                {
                    //negative z face
                    if (pointZBucket >= zBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 14);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(negYFace, radius, cornerValues, distance) || isFaceIntersected(negZFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket, yBucket - 1, zBucket - 1));
                        }
                    }
                    //positive z face
                    if (pointZBucket <= zBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 15);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(negYFace, radius, cornerValues, distance) || isFaceIntersected(posZFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket, yBucket - 1, zBucket + 1));
                        }
                    }
                }
                //positive y face
                if (pointYBucket <= yBucket)
                {
                    //negative z face
                    if (pointZBucket >= zBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 16);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(posYFace, radius, cornerValues, distance) || isFaceIntersected(negZFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket, yBucket + 1, zBucket - 1));
                        }
                    }
                    //positive z face
                    if (pointZBucket <= zBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 17);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(posYFace, radius, cornerValues, distance) || isFaceIntersected(posZFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket, yBucket + 1, zBucket + 1));
                        }
                    }
                }
            }

            //if this lies in the same y plane
            if (pointYBucket == yBucket)
            {
                //negative x face
                if (pointXBucket >= xBucket)
                {
                    //negative z face
                    if (pointZBucket >= zBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 18);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(negXFace, radius, cornerValues, distance) || isFaceIntersected(negZFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket - 1, yBucket, zBucket - 1));
                        }
                    }
                    //positive z face
                    if (pointZBucket <= zBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 19);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(negXFace, radius, cornerValues, distance) || isFaceIntersected(posZFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket - 1, yBucket, zBucket + 1));
                        }
                    }
                }
                //positive x face
                if (pointXBucket <= xBucket)
                {
                    //negative z face
                    if (pointZBucket >= zBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 20);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(posXFace, radius, cornerValues, distance) || isFaceIntersected(negZFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket + 1, yBucket, zBucket - 1));
                        }
                    }
                    //positive z face
                    if (pointZBucket <= zBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 21);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(posXFace, radius, cornerValues, distance) || isFaceIntersected(posZFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket + 1, yBucket, zBucket + 1));
                        }
                    }
                }
            }

            //if this lies in the same z plane
            if (pointZBucket == zBucket)
            {
                //negative x face
                if (pointXBucket >= xBucket)
                {
                    //negative y face
                    if (pointYBucket >= yBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 22);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(negXFace, radius, cornerValues, distance) || isFaceIntersected(negYFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket - 1, yBucket - 1, zBucket));
                        }
                    }
                    //positive y face
                    if (pointYBucket <= yBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 23);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(negXFace, radius, cornerValues, distance) || isFaceIntersected(posYFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket - 1, yBucket + 1, zBucket));
                        }
                    }
                }
                //positive x face
                if (pointXBucket <= xBucket)
                {
                    //negative y face
                    if (pointYBucket >= yBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 24);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(posXFace, radius, cornerValues, distance) || isFaceIntersected(negYFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket + 1, yBucket - 1, zBucket));
                        }
                    }
                    //positive y face
                    if (pointYBucket <= yBucket)
                    {
                        Vector3 edgeVector = GetEdgePoint(point, 25);
                        float distance = Vector3.Distance(edgeVector, point);
                        if (isFaceIntersected(posXFace, radius, cornerValues, distance) || isFaceIntersected(posYFace, radius, cornerValues, distance))
                        {
                            intersections.Add(new Cube(xBucket + 1, yBucket + 1, zBucket));
                        }
                    }
                }
            }
        }

        /// <summary>
        /// calculates the vector at the given edge of the given bucket in the same hight as the given point.
        /// (1 coordinate is the same as the point's, the other two get moved so that the point lies on the edge.)
        /// 
        /// indexing as follows:
        ///     14 to 17: leave x plane, move y and z
        ///     18 to 21: leave y plane, move x and z
        ///     22 to 25: leave z plane, move x and y
        /// withing these regions:  the lowest number corresponds to both the lower coordinates
        ///                         the second number corresponds to the higher z (or y), lower x (or y) coordinate
        ///                         the third number corresponds to higher x (or y), lower y (or z) coordinate
        ///                         the fourth number corresponds to both the higher coordinates
        /// </summary>
        /// <param name="xBucket"></param>
        /// <param name="yBucket"></param>
        /// <param name="zBucket"></param>
        /// <param name="point"></param>
        /// <param name="edgeIndex"></param>
        /// <returns></returns>
        private Vector3 GetEdgePoint(Vector3 point, int edgeIndex)
        {
            float x, y, z;
            switch (edgeIndex)
            {
                ///same x plane
                case 14:
                    x = point.x;
                    y = yMin + yBucket * bucketSize;
                    z = zMax + zBucket * bucketSize;
                    break;
                case 15:
                    x = point.x;
                    y = yMin + yBucket * bucketSize;
                    z = zMax + (zBucket + 1) * bucketSize;
                    break;
                case 16:
                    x = point.x;
                    y = yMin + (yBucket + 1) * bucketSize;
                    z = zMax + zBucket * bucketSize;
                    break;
                case 17:
                    x = point.x;
                    y = yMin + (yBucket + 1) * bucketSize;
                    z = zMax + (zBucket + 1) * bucketSize;
                    break;

                ///same y plane
                case 18:
                    x = xMin + xBucket * bucketSize;
                    y = point.y;
                    z = zMax + zBucket * bucketSize;
                    break;
                case 19:
                    x = xMin + xBucket * bucketSize;
                    y = point.y;
                    z = zMax + (zBucket + 1) * bucketSize;
                    break;
                case 20:
                    x = xMin + (xBucket + 1) * bucketSize;
                    y = point.y;
                    z = zMax + zBucket * bucketSize;
                    break;
                case 21:
                    x = xMin + (xBucket + 1) * bucketSize;
                    y = point.y;
                    z = zMax + (zBucket + 1) * bucketSize;
                    break;

                ///same z plane
                case 22:
                    x = xMin + xBucket * bucketSize;
                    y = yMin + yBucket * bucketSize;
                    z = point.z;
                    break;
                case 23:
                    x = xMin + xBucket * bucketSize;
                    y = yMin + (yBucket + 1) * bucketSize;
                    z = point.z;
                    break;
                case 24:
                    x = xMin + (xBucket + 1) * bucketSize;
                    y = yMin + yBucket * bucketSize;
                    z = point.z;
                    break;
                case 25:
                    x = xMin + (xBucket + 1) * bucketSize;
                    y = yMin + (yBucket + 1) * bucketSize;
                    z = point.z;
                    break;
                default:
                    throw new ArgumentException("Cube.GetEdgePoint(): Edge Index must range from 14 to 25.");
            }
            return new Vector3(x, y, z);
        }

        private void CalculateNeighborsFromSpecialCases_Faces(Vector3 point, float radius, float[] cornerValues, List<Cube> intersections, int pointXBucket, int pointYBucket, int pointZBucket)
        {
            //if this lies in z direction
            if (pointXBucket == xBucket && pointYBucket == yBucket)
            {
                //positive z
                if (pointZBucket <= zBucket && !intersections.Contains(new Cube(xBucket, yBucket, zBucket + 1)))
                {
                    Vector3 faceVector = GetFacePoint(point, 13);
                    float distance = Vector3.Distance(faceVector, point);
                    if (isFaceIntersected(posZFace, radius, cornerValues, distance))
                    {
                        intersections.Add(new Cube(xBucket, yBucket, zBucket + 1));
                    }
                }
                //negative z
                if (pointZBucket >= zBucket && !intersections.Contains(new Cube(xBucket, yBucket, zBucket - 1)))
                {
                    Vector3 faceVector = GetFacePoint(point, 12);
                    float distance = Vector3.Distance(faceVector, point);
                    if (isFaceIntersected(negZFace, radius, cornerValues, distance))
                    {
                        intersections.Add(new Cube(xBucket, yBucket, zBucket - 1));
                    }
                }
            }

            //if this lies in y direction
            if (pointXBucket == xBucket && pointZBucket == zBucket)
            {
                //positive y
                if (pointYBucket <= yBucket && !intersections.Contains(new Cube(xBucket, yBucket + 1, zBucket)))
                {
                    Vector3 faceVector = GetFacePoint(point, 11);
                    float distance = Vector3.Distance(faceVector, point);
                    if (isFaceIntersected(posYFace, radius, cornerValues, distance))
                    {
                        intersections.Add(new Cube(xBucket, yBucket + 1, zBucket));
                    }
                }
                //negative y
                if (pointYBucket <= yBucket && !intersections.Contains(new Cube(xBucket, yBucket - 1, zBucket)))
                {
                    Vector3 faceVector = GetFacePoint(point, 10);
                    float distance = Vector3.Distance(faceVector, point);
                    if (isFaceIntersected(negYFace, radius, cornerValues, distance))
                    {
                        intersections.Add(new Cube(xBucket, yBucket - 1, zBucket));
                    }
                }
            }

            //if this lies in x direction
            if (pointYBucket == yBucket && pointZBucket == zBucket)
            {
                //positive x
                if (pointXBucket <= xBucket && !intersections.Contains(new Cube(xBucket + 1, yBucket, zBucket)))
                {
                    Vector3 faceVector = GetFacePoint(point, 9);
                    float distance = Vector3.Distance(faceVector, point);
                    if (isFaceIntersected(posXFace, radius, cornerValues, distance))
                    {
                        intersections.Add(new Cube(xBucket + 1, yBucket, zBucket));
                    }
                }
                //negative x
                if (pointXBucket <= xBucket && !intersections.Contains(new Cube(xBucket - 1, yBucket, zBucket)))
                {
                    Vector3 faceVector = GetFacePoint(point, 8);
                    float distance = Vector3.Distance(faceVector, point);
                    if (isFaceIntersected(negXFace, radius, cornerValues, distance))
                    {
                        intersections.Add(new Cube(xBucket - 1, yBucket, zBucket));
                    }
                }
            }
        }

        /// <summary>
        /// calculates the vector at the given face of the given bucket in the height given by the point (keeps two coordinates and moves the third to the face)
        /// face indexing: face towards negative x has index 8,
        ///                             positive x has index 9,
        ///                             negative y has index 10,
        ///                             positive y has index 11,
        ///                             negative z has index 12,
        ///                             positive z has index 13.
        /// </summary>
        /// <param name="xBucket"></param>
        /// <param name="yBucket"></param>
        /// <param name="zBucket"></param>
        /// <param name="point"></param>
        /// <param name="faceIndex"></param>
        /// <returns></returns>
        private Vector3 GetFacePoint(Vector3 point, int faceIndex)
        {
            float x, y, z;
            switch (faceIndex)
            {
                //negative x
                case 8:
                    x = xMin + xBucket * bucketSize;
                    y = point.y;
                    z = point.z;
                    break;

                //positive x
                case 9:
                    x = xMin + (xBucket + 1) * bucketSize;
                    y = point.y;
                    z = point.z;
                    break;

                //negative y
                case 10:
                    x = point.x;
                    y = yMin + yBucket * bucketSize;
                    z = point.z;
                    break;

                //positive y
                case 11:
                    x = point.x;
                    y = yMin + (yBucket + 1) * bucketSize;
                    z = point.z;
                    break;

                //negative z
                case 12:
                    x = point.x;
                    y = point.y;
                    z = zMin + zBucket * bucketSize;
                    break;

                //positive z
                case 13:
                    x = point.x;
                    y = point.y;
                    z = zMin + (zBucket + 1) * bucketSize;
                    break;

                default:
                    throw new ArgumentException("Cube.GetFacePoint(): Face Index must range from 8 to 13.");
            }

            return new Vector3(x, y, z);
        }

        /// <summary>
        /// calculates from the corner values which faces are intersected and puts the corresponding cubes in a list
        /// </summary>
        /// <param name="radius"></param>
        /// <param name="cornerValues"></param>
        /// <returns></returns>
        private List<Cube> CalculateIntersectionsFromCorners(float radius, float[] cornerValues)
        {
            List<Cube> intersectedNeighbors = new List<Cube>();

            //negative x face
            if (isFaceIntersected(negXFace, radius, cornerValues))
            {
                intersectedNeighbors.Add(new Cube(xBucket - 1, yBucket, zBucket));
            }
            
            //positive x face
            if (isFaceIntersected(posXFace, radius, cornerValues))
            {
                intersectedNeighbors.Add(new Cube(xBucket + 1, yBucket, zBucket));
            }

            //negative y face
            if (isFaceIntersected(negYFace, radius, cornerValues))
            {
                intersectedNeighbors.Add(new Cube(xBucket, yBucket - 1, zBucket));
            }

            //positive y face
            if (isFaceIntersected(posYFace, radius, cornerValues))
            {
                intersectedNeighbors.Add(new Cube(xBucket, yBucket + 1, zBucket));
            }

            //negative z face
            if (isFaceIntersected(negZFace, radius, cornerValues))
            {
                intersectedNeighbors.Add(new Cube(xBucket, yBucket, zBucket - 1));
            }

            //positive z face
            if (isFaceIntersected(posZFace, radius, cornerValues))
            {
                intersectedNeighbors.Add(new Cube(xBucket, yBucket, zBucket + 1));
            }

            return intersectedNeighbors;
        }

        /// <summary>
        /// calculates if out of four (or five) given values there are values lesser as well as greater than the radius
        /// </summary>
        /// <param name="indices">the four indices specifying a face. see the static members at the top for details</param>
        /// <param name="radius">the radius to check against</param>
        /// <param name="cornerValues">the array of corner values for this cube</param>
        /// <param name="additionallyCheckedValue">an additional fifth value. can be null in which case it isn't checked</param>
        /// <returns>true iff an intersection is found on this face</returns>
        private bool isFaceIntersected(int[] indices, float radius, float[] cornerValues, float? additionallyCheckedValue = null)
        {
            bool inside = false;
            bool outside = false;

            for(int i = 0; i < 4; i++)
            {
                if (cornerValues[indices[i]] < radius)
                {
                    inside = true;
                }
                else
                {
                    outside = true;
                }
            }
            if (additionallyCheckedValue.HasValue)
            {
                if (additionallyCheckedValue < radius)
                {
                    inside = true;
                }
                else
                {
                    outside = true;
                }
            }

            return (inside && outside);
        }

        /// <summary>
        /// calculates the distances from the corners to the given point
        /// </summary>
        /// <param name="point"></param>
        private void CalculateCornerValues(Vector3 point, float[] cornerValues)
        {
            for(int i = 0; i < 8; i++)
            {
                cornerValues[i] = Vector3.Distance(GetCornerPoint(i), point);
            }
        }

        /// <summary>
        /// calculates the vector at the specified corner index (for how indexing works see field above)
        /// </summary>
        /// <param name="index"></param>
        /// <returns></returns>
        private Vector3 GetCornerPoint(int index)
        {
            int xOffset = (index & (1 << 2)) / 4;
            int yOffset = (index & (1 << 1)) / 2;
            int zOffset = (index & 1);

            try
            {
                Assert.IsTrue(xOffset == 0 || xOffset == 1);
                Assert.IsTrue(yOffset == 0 || yOffset == 1);
                Assert.IsTrue(zOffset == 0 || zOffset == 1);
            }
            catch (AssertionException)
            {
                throw new Exception();
            }

            float x = xMin + (xBucket + xOffset) * bucketSize;
            float y = yMin + (yBucket + yOffset) * bucketSize;
            float z = zMin + (zBucket + zOffset) * bucketSize;
            return new Vector3(x, y, z);
        }

        #region bug workaround. this is unoptimized code just to get it working
        /// <summary>
        /// an unoptimized function that tells if this cube is intersected by a sphere around the point with a given radius
        /// </summary>
        /// <param name="point">the center of the sphere</param>
        /// <param name="radius">the radius given as an int (will be scaled in the function)</param>
        /// <returns>true if the sphere intersects the cube. spheres with radius 0 inside of this cube will also count as intersecting</returns>
        public bool isIntersected(Vector3 point, int radius)
        {
            //check if a sphere with radius 0 is originating inside the cube. if so return true
            if(radius == 0 && isPointInCube(point))
            {
                return true;
            }

            float scaledRadius = radius * bucketSize;

            float[] cornerValues = new float[8];
            CalculateCornerValues(point, cornerValues);

            bool inside = false;
            bool outside = false;

            //calculate intersections from corner values
            foreach (float value in cornerValues)
            {
                if (value <= scaledRadius)
                {
                    inside = true;
                }
                if (value >= scaledRadius)
                {
                    outside = true;
                }
            }

            //if there's already an intersection return true
            if (inside && outside)
            {
                return true;
            }
            //else if all corner points lie inside, there's no point that could lie farther from the farthest corner, so return false in this case
            else if (inside)
            {
                return false;
            }

            //else check for edges and faces that lie closer than the corners

            //brute force check all edges
            for(int i = 14; i <= 25; i++)
            {
                //calculate point on edge. This will only result in a valid point if the edge that is
                //checked is orthogonal to the same plane that this cube is in (relative to the center of the sphere)
                Vector3 checkedPoint = GetEdgePoint(point, i);
                //check if the point is within this cube, if not continue to the next edge
                if (!isPointInCube(checkedPoint))
                {
                    continue;
                }
                else
                {
                    if(Vector3.Distance(point, checkedPoint) <= scaledRadius)   //this condition makes "inside" true. since this section of code is only
                                                                                //executed if outside is true and inside is false, we can report an intersection
                    {
                        return true;
                    } 
                }
            }

            //brute force check all faces
            for(int i = 8; i <= 13; i++)
            {
                //same thing as before, only that faces are checked. this will only result in a valid point if the
                //cube (relatively to the center of the sphere) lies orthogonal to the checked face
                Vector3 checkedPoint = GetFacePoint(point, i);
                //check if the point is within this cube, if not continue to the next face
                if (!isPointInCube(checkedPoint))
                {
                    continue;
                }
                else
                {
                    if (Vector3.Distance(point, checkedPoint) <= scaledRadius)   //this condition makes "inside" true. since this section of code is only
                                                                                 //executed if outside is true and inside is false, we can report an intersection
                    {
                        return true;
                    }
                }
            }

            //else return false
            return false;
        }

        /// <summary>
        /// checks whether a given point lies within this cube (including faces, edges, corners)
        /// </summary>
        /// <param name="checkedPoint">the point to check</param>
        /// <returns>true iff the point is within the cube or on the boundary</returns>
        private bool isPointInCube(Vector3 checkedPoint)
        {
            Vector3 minimumValuedCorner = GetCornerPoint(0);
            Vector3 maximumValuedCorner = GetCornerPoint(7);
            return
                checkedPoint.x >= minimumValuedCorner.x && checkedPoint.x <= maximumValuedCorner.x
                && checkedPoint.y >= minimumValuedCorner.y && checkedPoint.y <= maximumValuedCorner.y
                && checkedPoint.z >= minimumValuedCorner.z && checkedPoint.z <= maximumValuedCorner.z;
        }
        #endregion
    }
    #endregion

    #region cast direction calculation and caching

    /// <summary>
    /// a list that holds precalculated cast directions. The indices refer to the the direction array with that radius
    /// </summary>
    static List<Vector3[]> precalculatedDirections = new List<Vector3[]>(5);

    /// <summary>
    /// returns the necessary cast directions for this radius. They have already the correct size
    /// </summary>
    /// <param name="radius">the radius of the sphere that needs to be checked</param>
    /// <returns>the necessary cast directions</returns>
    private Vector3[] GetCastDirections(int radius)
    {
        
        if (radius >= precalculatedDirections.Count)
        {
            for (float i = precalculatedDirections.Count; i <= radius; i++)
            {
                precalculatedDirections.Add(CalculateCastDirections(i * (float)Math.Sqrt(3)));
            }
        }
        return precalculatedDirections[radius];
    }

    /// <summary>
    /// calculates in which direction one needs to cast to find all the buckets on a given radius. The vectors have already radius length
    /// </summary>
    /// <param name="radius">the radius of the cast</param>
    /// <returns>an array of direction vectors with radius length</returns>
    private Vector3[] CalculateCastDirections(float radius)
    {
        int intRadius = (int)Math.Ceiling(radius);
        Vector3[] directions = new Vector3[24 * intRadius * intRadius + 2];
        /* 
         * Imagine the surrounding cube of the ball with the radius. Then number of directions <= array length = 2*(x face + y face + z face)
         *      =   2*(     (2*radius + 1) * (2*radius + 1)     + (2*radius - 1) * (2*radius + 1)   + (2*radius - 1) * (2*radius - 1)   )
         *      =   2*(             (2*radius + 1 + 2*radius - 1) * (2*radius + 1)                  + 4*radius^2 - 4*radius + 1         )
         *      =   2*(                     4*radius * (2*radius + 1)                               + 4*radius^2 - 4*radius + 1         )
         *      =   2*(                 4*radius * 2*radius + 4*radius                              + 4*radius^2 - 4*radius + 1         )
         *      =   2*(                     8*radius^2 + 4*radius                                   + 4*radius^2 - 4*radius + 1         )
         *      =   2*(                                 (8 + 4) * radius^2 + (4-4) * radius + 1                                         )
         *      =   2*(                                         12*radius^2 + 1                                                         )
         *      
         *      =   24*radius^2 + 2
         * */
        float scaledRadius = (float)intRadius * bucketSize;
        if ((float)(intRadius - 1) * bucketSize  > diagonalLength * 2)
        {
            throw new Exception("somewhere in the cast directions section there is a bug: requested a radius of " + intRadius + " with bucket size " + bucketSize + " and diagonal length " + diagonalLength);
        }
        int currentIndex = 0;

        //calculate -x and +x faces
        for (int y = -intRadius; y <= intRadius; y++)
        {
            for (int z = -intRadius; z <= intRadius; z++)
            {
                directions[currentIndex] = Vector3.Normalize(new Vector3(-intRadius, y, z)) * scaledRadius;
                currentIndex++;
                directions[currentIndex] = Vector3.Normalize(new Vector3(intRadius, y, z)) * scaledRadius;
                currentIndex++;
            }
        }

        //calculate -y and +y faces
        for (int x = -intRadius + 1; x < intRadius; x++)
        {
            for (int z = -intRadius; z <= intRadius; z++)
            {
                directions[currentIndex] = Vector3.Normalize(new Vector3(x, -intRadius, z)) * scaledRadius;
                currentIndex++;
                directions[currentIndex] = Vector3.Normalize(new Vector3(x, intRadius, z)) * scaledRadius;
                currentIndex++;
            }
        }

        //calculate -z and +z faces
        for (int x = -intRadius + 1; x < intRadius; x++)
        {
            for (int y = -intRadius + 1; y < intRadius; y++)
            {
                directions[currentIndex] = Vector3.Normalize(new Vector3(x, y, -intRadius)) * scaledRadius;
                currentIndex++;
                directions[currentIndex] = Vector3.Normalize(new Vector3(x, y, intRadius)) * scaledRadius;
                currentIndex++;
            }
        }

        Assert.AreEqual(directions.Length, currentIndex);
        foreach (Vector3 vector in directions)
        {
            Assert.AreApproximatelyEqual(scaledRadius, vector.magnitude);
        }
        return directions;
    }
    #endregion


    #endregion



    public void BuildTangentPlanes()
    {
        EstimateTangentPlanes();
        Timer.Time("SpatialHashmap.EstimateTangentPlanes()", true);
        OrientTangentPlanes();
        //Extension.Time("SpatialHashmap.OrientTangentPlanes()");
    }

    /// <summary>
    /// estimates the tangent planes from the point cloud and stores them in this data structure
    /// </summary>
    private void EstimateTangentPlanes()
    {
        //loop over all buckets
        foreach (PointBucket pointBucket in pointBuckets.Values)
        {
            //loop over all points
            foreach (Vector3 point in pointBucket.Points)
            {
                //get neigbors
                Vector3[] neighbors = NearestNeighborPoints(point, Controller.consideredNeighbors);
                Vector3 center = Vector3.zero;
                float[,] covarianceMatrix = new float[3, 3];

                //calculate center of tangent plane (sum all neighbor points, then divide by the amount of neighbors)
                //sum the dyadic products
                for(int i = 0; i < Controller.consideredNeighbors; i++)
                {
                    center += neighbors[i];
                    Extension.AddDyadicProduct(ref covarianceMatrix, neighbors[i], point);
                }
                center /= Controller.consideredNeighbors;

                //update rho
                float distanceRelevantForRho = Vector3.Distance(point, neighbors[neighborConsideredForRho]);
                rho = distanceRelevantForRho > rho ? distanceRelevantForRho : rho;

                //read eigenvectors
                EigenvalueDecompositionF eigenvalueDecomposition = new EigenvalueDecompositionF(covarianceMatrix, true, true, true);
                try
                {
                    Assert.IsTrue(eigenvalueDecomposition.RealEigenvalues[0] >= eigenvalueDecomposition.RealEigenvalues[1]);
                }
                catch (AssertionException)
                {
                    Extension.Log("EstimateTangentPlanes(): eigenvalue " + eigenvalueDecomposition.RealEigenvalues[0] + " is smaller than eigenvalue " + eigenvalueDecomposition.RealEigenvalues[1]);
                }
                try
                {
                    Assert.IsTrue(eigenvalueDecomposition.RealEigenvalues[1] >= eigenvalueDecomposition.RealEigenvalues[2]);
                }
                catch (AssertionException)
                {
                    Extension.Log("EstimateTangentPlanes(): eigenvalue " + eigenvalueDecomposition.RealEigenvalues[1] + " is smaller than eigenvalue " + eigenvalueDecomposition.RealEigenvalues[2]);
                }
                float[,] eigenvectors = eigenvalueDecomposition.Eigenvectors;
                Vector3 normalDirection = new Vector3(eigenvectors[0, 2], eigenvectors[1, 2], eigenvectors[2, 2]);
                Assert.AreApproximatelyEqual(1, normalDirection.magnitude);

                //insert calculated plane
                Insert(new TangentPlane(center, normalDirection));
            }
        }

        RhoPlusDelta = Controller.rhoPlusDelta.HasValue ? Controller.rhoPlusDelta.Value : rho + delta;
        Extension.Log("SpatialHashmap.EstimateTangentPlanes(): rho + delta = " + RhoPlusDelta);
    }

    /// <summary>
    /// orients the tangent planes to be consistent with each other
    /// </summary>
    private void OrientTangentPlanes()
    {
        //calculate minimal spanning tree for traversal during orientation phase
        Extension.Log("SpatialHashmap.OrientTangentPlanes(): building tangent plane graph");
        TangentPlaneGraphNode[] graph = BuildTangentPlaneGraph();
        Timer.Time("SpatialHashmap.BuildTangentPlaneGraph()", true);
        Extension.Log("SpatialHashmap.OrientTangentPlanes(): connecting graph");
        ConnectGraph(ref graph);
        Timer.Time("SpatialHashmap.ConnectGraph()", true);
        Extension.Log("SpatialHashmap.OrientTangentPlanes(): calculating MST");
        CalculateMinimumSpanningTree(ref graph);
        Timer.Time("SpatialHashmap.CalculateMinimumSpanningTree()", false);
        
        //CheckCorrectEdgeCount(ref graph);
        
        //perform orientation
        Extension.Log("SpatialHashmap.OrientTangentPlanes(): traversing MST");
        TangentPlaneGraphNode root = graph[tangentPlaneWithLargestZ.id];
        if (Vector3.Dot(root.plane.normal, Vector3.forward) < 0)
        {
            root.plane.normal = -root.plane.normal;
        }
        root.oriented = true;
        TraverseMinimumSpanningTree(ref graph, root, 1);
        Timer.Time("SpatialHashmap.TraverseMinimumSpanningTree()", false);
    }

    #region graph algorithms for orientation

    /// <summary>
    /// traverses the minimum spanning tree and orients the normal of each node to be consistent with their parent's normal
    /// </summary>
    /// <param name="graph">the graph to traverse</param>
    /// <param name="parent">the currently visited node</param>
    private static void TraverseMinimumSpanningTree(ref TangentPlaneGraphNode[] graph, TangentPlaneGraphNode parent, int recursionDepth)
    {
        TangentPlane parentPlane = parent.plane;
        List<int> childIDs = graph[parent.plane.id].childrenInMST;
        for (int i = 0; i < childIDs.Count; i++)
        {
            int childID = childIDs[i];
            TangentPlane childPlane = graph[childID].plane;
            if(Vector3.Dot(parentPlane.normal, childPlane.normal) < 0)
            {
                childPlane.normal = -childPlane.normal;
            }
            graph[childID].oriented = true;
            
            TraverseMinimumSpanningTree(ref graph, graph[childID], recursionDepth + 1);
        }
    }

    /// <summary>
    /// builds a graph of tangent planes. two planes are connected if either one of them is in the k-neighborhood of the other one.
    /// </summary>
    /// <returns>an adjacency list that represents the graph</returns>
    private TangentPlaneGraphNode[] BuildTangentPlaneGraph()
    {
        //set up graph array
        TangentPlaneGraphNode[] adjacencyList = new TangentPlaneGraphNode[Count];
        foreach (TangentPlaneBucket bucket in planeBuckets.Values)
        {
            foreach (TangentPlane plane in bucket.Planes)
            {
                //Debug.Log("Accessing tangent plane " + plane.id);
                adjacencyList[plane.id] = new TangentPlaneGraphNode(plane);
            }
        }

        //calculate neighbors
        //loop over nodes
        foreach (TangentPlaneGraphNode node in adjacencyList)
        {
            //loop over neighbors
            foreach (TangentPlane neighbor in NearestNeighborPlanes(node.plane, Controller.consideredNeighbors))
            {
                // add the neighbor to this node's adjacencies if it isn't already there
                if (!node.adjacencies.Contains(neighbor.id))
                {
                    node.adjacencies.Add(neighbor.id);
                }
                // add this node to the neighbor's adjacencies if it isn't already there
                if (!adjacencyList[neighbor.id].adjacencies.Contains(node.plane.id))
                {
                    adjacencyList[neighbor.id].adjacencies.Add(node.plane.id);
                }
            }
        }

        return adjacencyList;
    }

    /// <summary>
    /// calculates connected components and if the graph is not connected, inserts minimal missing edges
    /// </summary>
    /// <param name="graph">the graph to connect</param>
    private static void ConnectGraph(ref TangentPlaneGraphNode[] graph)
    {
        int numberOfConnectedComponents;
        ClassifyConnectedComponents(ref graph, out numberOfConnectedComponents);


        Extension.Log("SpatialHashmap.ConnectGraph(): graph has " + numberOfConnectedComponents + " connected components");
        if (numberOfConnectedComponents > 1)
        {
            List<Edge> edgeList = GetMinimalConnectingEdges(ref graph, numberOfConnectedComponents);

            //connect graph
            InsertNecessaryMinimalEdges(ref graph, numberOfConnectedComponents, ref edgeList);
        }
    }

    /// <summary>
    /// inserts so many minimal connecting edges that the graph is connected
    /// </summary>
    /// <param name="graph">the graph</param>
    /// <param name="numberOfConnectedComponents">the number of connected components</param>
    /// <param name="edgeList">a sorted list of minimal edges that connect two pairwise unconnected components</param>
    private static void InsertNecessaryMinimalEdges(ref TangentPlaneGraphNode[] graph, int numberOfConnectedComponents, ref List<Edge> edgeList)
    {
        //setup set list
        HashSet<HashSet<int>> connectionsMade = new HashSet<HashSet<int>>();
        for (int i = 0; i < numberOfConnectedComponents; i++)
        {
            HashSet<int> hashSet = new HashSet<int>();
            hashSet.Add(i);
            connectionsMade.Add(hashSet);
        }

        //iterate over edges
        foreach (Edge edge in edgeList)
        {
            //find hash sets of ending points
            int firstConnectedComponent = edge.first.connectedComponent;
            int secondConnectedComponent = edge.second.connectedComponent;
            HashSet<int> firstHashSet = null, secondHashSet = null;
            foreach (HashSet<int> hashSet in connectionsMade)
            {
                if (hashSet.Contains(firstConnectedComponent))
                {
                    firstHashSet = hashSet;
                }
                if (hashSet.Contains(secondConnectedComponent))
                {
                    secondHashSet = hashSet;
                }
            }

            //check if the sets are different. If true, they are already connected
            if (firstHashSet != secondHashSet)
            {
                //add edge to graph
                graph[edge.first.plane.id].adjacencies.Add(edge.second.plane.id);
                graph[edge.second.plane.id].adjacencies.Add(edge.first.plane.id);

                //union sets
                firstHashSet.UnionWith(secondHashSet);
                connectionsMade.Remove(secondHashSet);

                //break early if graph contains only one component anymore
                if (connectionsMade.Count == 1)
                {
                    break;
                }
            }
        }
    }

    /// <summary>
    /// calculates the pairwise minimal connecting edges between all unconnected ragions in the graph
    /// </summary>
    /// <param name="graph">the graph to check</param>
    /// <param name="numberOfConnectedComponents">the number of components</param>
    /// <returns>a sorted-by-length list of smalles conencting edges</returns>
    private static List<Edge> GetMinimalConnectingEdges(ref TangentPlaneGraphNode[] graph, int numberOfConnectedComponents)
    {
        //separate graph by connected components
        List<TangentPlaneGraphNode>[] connectedComponents = new List<TangentPlaneGraphNode>[numberOfConnectedComponents];
        for (int i = 0; i < numberOfConnectedComponents; i++)
        {
            connectedComponents[i] = new List<TangentPlaneGraphNode>();
        }
        foreach (TangentPlaneGraphNode node in graph)
        {
            connectedComponents[node.connectedComponent].Add(node);
        }

        //calculate smallest connecting edges
        int NumberOfEdgesToConsider = (numberOfConnectedComponents - 1) * numberOfConnectedComponents / 2;  // sum from 1 to n-1
        List<Edge> edgeList = new List<Edge>(NumberOfEdgesToConsider);

        for (int i = 0; i < numberOfConnectedComponents; i++)
        {
            for (int j = i + 1; j < numberOfConnectedComponents; j++)
            {
                Edge smallestEdge = new Edge();
                float smallestDistance = float.PositiveInfinity;

                foreach (TangentPlaneGraphNode firstNode in connectedComponents[i])
                {
                    foreach (TangentPlaneGraphNode secondNode in connectedComponents[j])
                    {
                        float distance = Vector3.Distance(firstNode.plane.center, secondNode.plane.center);
                        if (distance < smallestDistance)
                        {
                            smallestDistance = distance;
                            smallestEdge = new Edge(firstNode, secondNode, distance);
                        }
                    }
                }

                edgeList.Add(smallestEdge);
            }
        }
        edgeList.Sort(Edge.Compare);
        return edgeList;
    }


    

    /// <summary>
    /// performs a depth-first search on a graph and classifies all connected components
    /// </summary>
    /// <param name="graph">the graph whose connected components to classify</param>
    private static void ClassifyConnectedComponents(ref TangentPlaneGraphNode[] graph, out int connectedComponent)
    {
        Stack<TangentPlaneGraphNode> DFSStack = new Stack<TangentPlaneGraphNode>();
        connectedComponent = 0;
        for(int i = 0; i < graph.Length; i++)
        {
            if (!graph[i].visited)
            {
                DFSStack.Push(graph[i]);
                while(DFSStack.Count > 0)
                {
                    TangentPlaneGraphNode node = DFSStack.Pop();
                    node.visited = true;
                    node.connectedComponent = connectedComponent;
                    for (int j = 0; j < node.adjacencies.Count; j++)
                    {
                        if (!graph[node.adjacencies[j]].visited)
                        {
                            DFSStack.Push(graph[node.adjacencies[j]]);
                        }
                    }
                }
                connectedComponent++;
            }
        }
    }

    /// <summary>
    /// performs Prim's algorithm over a graph of tangent planes and writes the minimal
    /// spanning tree as a list of childs per node back into the graph data structure
    /// </summary>
    /// <param name="adjacencyList">the graph</param>
    private void CalculateMinimumSpanningTree(ref TangentPlaneGraphNode[] adjacencyList)
    {
        //Prim's algorithm (results in parent array)
        SimplePriorityQueue<TangentPlane> priorityQueue = new SimplePriorityQueue<TangentPlane>();
        foreach (TangentPlaneBucket bucket in planeBuckets.Values)
        {
            foreach (TangentPlane plane in bucket.Planes)
            {
                priorityQueue.Enqueue(plane, float.PositiveInfinity);
            }
        }
        priorityQueue.UpdatePriority(tangentPlaneWithLargestZ, 0);
        while (priorityQueue.Count > 0)
        {
            TangentPlane plane = priorityQueue.Dequeue();
            foreach (int neighborID in adjacencyList[plane.id].adjacencies)
            {
                TangentPlane neighborPlane = adjacencyList[neighborID].plane;
                if (priorityQueue.Contains(neighborPlane) && (1 - Math.Abs(Vector3.Dot(plane.normal, neighborPlane.normal)) < priorityQueue.GetPriority(neighborPlane)))
                {
                    adjacencyList[neighborID].parent = plane.id;
                    priorityQueue.UpdatePriority(neighborPlane, 1 - Math.Abs(Vector3.Dot(plane.normal, neighborPlane.normal)));
                }
            }
        }

        //set children for each parent
        foreach(TangentPlaneGraphNode node in adjacencyList)
        {
            if(node.parent != -1)
            {
                adjacencyList[node.parent].childrenInMST.Add(node.plane.id);
                //Extension.Log("SpatialHashmap.CalculateMinimumSpanningTree(): parent of node " + node.plane.id + " is " + node.parent);
            }
            else
            {
                //Extension.Log("SpatialHashmap.CalculateMinimumSpanningTree(): node " + node.plane.id + " is root");
            }
        }

        //CheckCorrectEdgeCount(ref adjacencyList);
        //CheckNoCircles(ref adjacencyList);
    }

    /// <summary>
    /// represents a node in the graph of tangent planes, along with a list of children that this node has in the minimum spanning tree
    /// </summary>
    private class TangentPlaneGraphNode
    {
        public TangentPlane plane;
        public List<int> adjacencies;
        public List<int> childrenInMST;
        public int parent = -1;

        public bool oriented = false;
        public bool visited = false;
        public int connectedComponent = -1;

        public TangentPlaneGraphNode(TangentPlane plane)
        {
            this.plane = plane;
            adjacencies = new List<int>(Controller.consideredNeighbors);
            childrenInMST = new List<int>();
        }
    }

    /// <summary>
    /// represents an edge in a graph between to nodes
    /// </summary>
    private struct Edge
    {
        public TangentPlaneGraphNode first;
        public TangentPlaneGraphNode second;
        public float length;

        public Edge(TangentPlaneGraphNode first, TangentPlaneGraphNode second, float length)
        {
            this.first = first;
            this.second = second;
            this.length = length;
        }

        public static int Compare(Edge a, Edge b)
        {
            if (a.length < b.length)
            {
                return -1;
            }
            else if (a.length == b.length)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
    }

    #endregion

    #region DEBUG

    /// <summary>
    /// returns an unordered array of all points contained in this data structure
    /// </summary>
    /// <returns>an array of points</returns>
    public Vector3[] ListPoints()
    {
        Vector3[] points = new Vector3[Count];
        int currentIndex = 0;
        foreach(PointBucket bucket in pointBuckets.Values)
        {
            currentIndex += bucket.ListPoints(points, currentIndex);
        }

        return points;
    }

    /// <summary>
    /// returns an unordered array of all planes contained in this data structure
    /// </summary>
    /// <returns>an array of planes</returns>
    public TangentPlane[] ListTangentPlanes()
    {
        TangentPlane[] planes = new TangentPlane[Count];
        int currentIndex = 0;
        foreach(TangentPlaneBucket bucket in planeBuckets.Values)
        {
            currentIndex += bucket.ListPlanes(planes, currentIndex);
        }

        return planes;
    }

    /// <summary>
    /// checks if the minimum spanning tree contains a circle
    /// </summary>
    /// <param name="adjacencyList"></param>
    private void CheckNoCircles(ref TangentPlaneGraphNode[] adjacencyList)
    {
        List<int> circleNodes = new List<int>();
        for (int i = 0; i < adjacencyList.Length; i++)
        {
            int currentNode = i;
            int depth = 0;
            while (adjacencyList[currentNode].parent != -1)
            {
                currentNode = adjacencyList[currentNode].parent;
                depth++;
                if (depth > adjacencyList.Length)
                {
                    circleNodes.Add(i);
                    continue;
                }
            }
        }
        if(circleNodes.Count > 0)
        {
            Extension.Log(circleNodes.ToArray().ToString<int>());
            throw new Exception("circles");
        }
    }

    /// <summary>
    /// checks if the minimum spanning tree contains the correct number of edges
    /// </summary>
    /// <param name="graph"></param>
    private void CheckCorrectEdgeCount(ref TangentPlaneGraphNode[] graph)
    {
        int edgeCount = 0;
        for (int i = 0; i < graph.Length; i++)
        {
            edgeCount += graph[i].childrenInMST.Count;
        }
        Assert.AreEqual(graph.Length - 1, edgeCount);
    }

    #endregion
}
