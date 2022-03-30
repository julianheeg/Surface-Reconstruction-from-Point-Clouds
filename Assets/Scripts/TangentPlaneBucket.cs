using Priority_Queue;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Assertions;

/// <summary>
/// represents a bucket in space. It holds the planes in a volumetric bounding box
/// </summary>
public class TangentPlaneBucket
{
#pragma warning disable 0414
    //for debug purposes
    static int bucketCount = 0;
    readonly int bucketID;
#pragma warning restore

    //holds the points in this bucket
    public List<TangentPlane> Planes { get; private set; }

    /// <summary>
    /// constructs a space bucket with an initial plane in it
    /// </summary>
    /// <param name="initialPlane">the first point</param>
    public TangentPlaneBucket(TangentPlane initialPlane)
    {
        Planes = new List<TangentPlane>();
        Planes.Add(initialPlane);

        bucketID = bucketCount;
        bucketCount++;
        //Extension.Log("Spacebucket.ctor(): Creating bucket number " + bucketID + " with initial point " + initialPlane.ToString());
    }

    /// <summary>
    /// resets the internal static id integer
    /// </summary>
    public static void ResetIDs()
    {
        bucketCount = 0;
    }

    /// <summary>
    /// adds a plane to this bucket
    /// </summary>
    /// <param name="plane">the plane to add</param>
    public void Add(TangentPlane plane)
    {
        Planes.Add(plane);
    }

    /// <summary>
    ///   adds all the planes within this bucket to the passed priority queue along with
    ///   their center distance from a point EXCEPT WHEN this bucket has been gathered already
    /// </summary>
    /// <param name="origin">the point to which to calculate the distance</param>
    /// <param name="priorityQueue">the priority queue where the points are inserted</param>
    public void GatherPoints(Vector3 origin, SimplePriorityQueue<TangentPlane> priorityQueue)
    {
        //check if this bucket has been gathered before
        if (!priorityQueue.Contains(Planes[0]))
        {
            //Extension.Log("SpaceBucket.GatherPoints(): gathering points from bucket " + bucketID);
            foreach (TangentPlane plane in Planes)
            {
                //Extension.Log("          putting " + plane.ToString() + " into the priority queue.");
                float distance = Vector3.Distance(origin, plane.center);
                priorityQueue.Enqueue(plane, distance);
            }
        }
    }

    /// <summary>
    ///   copies all the planes into an array starting at the passed index
    ///   returns the number of elements copied
    /// </summary>
    /// <param name="planesArray">the array where to copy the planes</param>
    /// <param name="index">the start index of the array</param>
    /// <returns>the number of points copied (/stored in this bucket)</returns>
    public int ListPlanes(TangentPlane[] planesArray, int index)
    {
        Planes.CopyTo(planesArray, index);
        return Planes.Count;
    }

    /// <summary>
    /// returns the minimum distance plane from a point in space
    /// </summary>
    /// <param name="point">the point in space</param>
    /// <returns></returns>
    public TangentPlane GetMinDistance(Vector3 point, out float minDistance)
    {
        TangentPlane planeWithMinDistance = null;
        minDistance = float.PositiveInfinity;
        foreach(TangentPlane plane in Planes)
        {
            float distance = Vector3.Distance(point, plane.center);
            if(distance < minDistance)
            {
                minDistance = distance;
                planeWithMinDistance = plane;
            }
        }
        Assert.IsNotNull(planeWithMinDistance);
        return planeWithMinDistance;
    }
}

