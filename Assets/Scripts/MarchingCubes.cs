using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.Assertions;

public class MarchingCubes : MonoBehaviour {
    public SubMesh subMeshPrefab;
    List<Vector3> vertices;     //a list of the vertices. At every ~60,000 indices a submesh is created and the list is cleared
                                //because unity imposes a limit of 65535 vertices per mesh
    List<int> triangles;        //the same here with triangles, given as vertex indices

    List<Vector3> allVertices;
    List<int> allTriangles;

    static SpatialHashmap dataSet;  //the data set which contains the points and tangent planes

    static float xMin;
    static float yMin;
    static float zMin;
    static float cubeSize;

    // Use this for initialization
    void Awake () {
        vertices = new List<Vector3>();
        triangles = new List<int>();
        allVertices = new List<Vector3>();
        allTriangles = new List<int>();
	}

    public void March(SpatialHashmap dataSet)
    {
        vertices.Clear();
        triangles.Clear();

        MarchingCubes.dataSet = dataSet;
        xMin = SpatialHashmap.xMin;
        yMin = SpatialHashmap.yMin;
        zMin = SpatialHashmap.zMin;
        cubeSize = Controller.cubeSize.HasValue ? Controller.cubeSize.Value : (float)(dataSet.RhoPlusDelta / Math.Sqrt(3));


        /*
         * idea: there is a dictionary of unvisited cubes and their already calculated vertices (not necessarily all of them are calculated yet)
         * additionally there is a stack with all the yet unvisited cubes. iterate:
         *      1. a cube is popped from the stack. get its calculated values from the dictionary. 
         *          (optional: remove the values from the dictionary, they are no longer needed
         *           and it might be better to keep the dictionary as small as possible)
         *      2. calculate the missing values and put the adjacent vertex values in the dictionary, or update the values if they are there already
         *      3. put all neighbors on the stack that have been newly added to the dictionary
         * */

        Dictionary<Cube, CornerValues> cornerValuesDictionary = new Dictionary<Cube, CornerValues>();
        Stack<Cube> unvisitedCubes = new Stack<Cube>();

        HashSet<Cube> DEBUG_VISITED_CUBES = new HashSet<Cube>();

        Cube firstCube = new Cube(dataSet.tangentPlaneWithLargestZ.center);
        cornerValuesDictionary.Add(firstCube, new CornerValues(CornerValues.AdjacentCubesAlreadyVisited.none, new float?[8]));
        unvisitedCubes.Push(firstCube);

        Cube[] neighbors = new Cube[6];

        while (unvisitedCubes.Count > 0)
        {
            Cube currentCube = unvisitedCubes.Pop();
            neighbors = currentCube.Neighbors;
            CornerValues cornerValues;

            if (cornerValuesDictionary.TryGetValue(currentCube, out cornerValues))
            {
                cornerValuesDictionary.Remove(currentCube);

                if (cornerValues.CalculateMissingValues(currentCube))
                {
                    Triangulate(currentCube, cornerValues);
                }
                bool[] flags = cornerValues.FlagBadAndAlreadyVisitedNeighbors();

                /*
                 * DEBUG
                 * */
                if (DEBUG_VISITED_CUBES.Contains(currentCube))
                {
                    //Extension.Log("MarchingCubes.March(): found double cube " + currentCube.ToString());
                    continue;
                    //throw new Exception();
                }
                else
                {
                    DEBUG_VISITED_CUBES.Add(currentCube);
                }
                /*
                 * DEBUG
                 * */

                for (int i = 0; i < 6; i++)
                {
                    if (!flags[i])  //a set flag means that the neighbor is already accounted for in the triangulation, therefore do nothing in that case
                    {
                        CornerValues neighborValues;
                        if (cornerValuesDictionary.TryGetValue(neighbors[i], out neighborValues))
                        {
                            neighborValues.Update(cornerValues.AdjacentValues(i));
                        }
                        else
                        {
                            neighborValues = cornerValues.AdjacentValues(i);
                            cornerValuesDictionary.Add(neighbors[i], neighborValues);
                            unvisitedCubes.Push(neighbors[i]);
                        }
                    }
                }
            }
            else
            {
                throw new Exception("MarchingCubes.March(): there is a cube on the stack that is not in the dictionary. Cube number: " + currentCube);
            }
        }

        CreateAndDisplaySubMeshAndClearLists();
        Timer.Time("MarchingCubes.March", true);

        WriteToDisk();
    }

    private void WriteToDisk()
    {
        using (StreamWriter streamWriter = new StreamWriter(Controller.standardFilePath + "_resolution_" + Controller.cubeSize + ".m"))
        {
            //write vertices
            for(int i = 0; i < allVertices.Count; i++)
            {
                Vector3 vertex = allVertices[i];
                string line = "Vertex " + (i + 1) + "  " + vertex.x + " " + vertex.y + " " + vertex.z;
                streamWriter.WriteLine(line);
            }

            //write triangles
            for(int i = 0; i < allTriangles.Count; i += 3)
            {
                int index1 = allTriangles[i] + 1;
                int index2 = allTriangles[i + 1] + 1;
                int index3 = allTriangles[i + 2] + 1;
                string line = "Face " + (i / 3) + "  " + index1 + " " + index2 + " " + index3;
                streamWriter.WriteLine(line);
            }
        }
    }

    public void MarchWithoutOptimization(SpatialHashmap dataSet)
    {
        vertices.Clear();
        triangles.Clear();

        MarchingCubes.dataSet = dataSet;
        xMin = SpatialHashmap.xMin;
        yMin = SpatialHashmap.yMin;
        zMin = SpatialHashmap.zMin;

        cubeSize = Controller.cubeSize.HasValue ? Controller.cubeSize.Value : (float)(dataSet.RhoPlusDelta / Math.Sqrt(3));


        /*
         * idea: there is a dictionary of unvisited cubes and their already calculated vertices (not necessarily all of them are calculated yet)
         * additionally there is a stack with all the yet unvisited cubes. iterate:
         *      1. a cube is popped from the stack. get its calculated values from the dictionary. 
         *          (optional: remove the values from the dictionary, they are no longer needed
         *           and it might be better to keep the dictionary as small as possible)
         *      2. calculate the missing values and put the adjacent vertex values in the dictionary, or update the values if they are there already
         *      3. put all neighbors on the stack that have been newly added to the dictionary
         * */

        for(float x = xMin; x < SpatialHashmap.xMax; x += cubeSize)
        {
            for(float y = yMin; y < SpatialHashmap.yMax; y += cubeSize)
            {
                for(float z = zMin; z < SpatialHashmap.zMax; z += cubeSize)
                {
                    Cube currentCube = new Cube(new Vector3(x, y, z));
                    CornerValues currentCornerValues = new CornerValues(CornerValues.AdjacentCubesAlreadyVisited.none, new float?[8]);
                    currentCornerValues.CalculateMissingValues(currentCube);
                    Triangulate(currentCube, currentCornerValues);
                }
            }
        }

        CreateAndDisplaySubMeshAndClearLists();
        Timer.Time("MarchingCubes.March", true);
    }

    /// <summary>
    /// represents the corner values of a cube
    /// </summary>
    private class CornerValues
    {
        public enum Corners { back_left_bottom = 0, back_right_bottom, front_right_bottom, front_left_bottom, back_left_top, back_right_top, front_right_top, front_left_top }
        public float?[] values = new float?[8]; //null means that the value has not been calculated yet

        [Flags]
        public enum AdjacentCubesAlreadyVisited { none = 0, top = 1, bottom = 2, left = 4, right = 8, front = 16, back = 32 }
        AdjacentCubesAlreadyVisited alreadyCalculatedNeighbors;


        /// <summary>
        /// constructs a corner values object from an array of corner values
        /// </summary>
        /// <param name="values"></param>
        public CornerValues(AdjacentCubesAlreadyVisited alreadyCalculatedNeighbors, float?[] values)
        {
            this.alreadyCalculatedNeighbors = alreadyCalculatedNeighbors;
            for (int i = 0; i < 8; i++)
            {
                this.values[i] = values[i];
            }
        }

        /// <summary>
        /// updates the values. this method is used when the corner values for an adjacent cube have been calculated.
        /// all non-null values in the passed array will be updated in this instance.
        /// </summary>
        /// <param name="updatedValues">the array of updated values</param>
        public void Update(CornerValues updated)
        {
            this.alreadyCalculatedNeighbors |= updated.alreadyCalculatedNeighbors;
            for (int i = 0; i < 8; i++)
            {
                if (updated.values[i] != null)
                {
                    values[i] = updated.values[i];
                }
            }
        }

        /// <summary>
        /// calculates the missing values for this cube
        /// </summary>
        /// <param name="cube">the cube</param>
        /// <returns>true if the values are defined in every corner, false otherwise</returns>
        public bool CalculateMissingValues(Cube cube)
        {
            bool hasNullValue = false;
            Vector3[] corners = cube.Corners;
            for (int i = 0; i < 8; i++)
            {
                if (!values[i].HasValue)
                {
                    values[i] = MarchingCubes.dataSet.Distance(corners[i]);
                    hasNullValue |= !values[i].HasValue;
                }
            }
            return !hasNullValue;
        }

        /// <summary>
        /// calculates flags for neighbors. true means that the neighbor doesn't need to be looked at anymore, false means they have to.
        /// </summary>
        /// <returns></returns>
        public bool[] FlagBadAndAlreadyVisitedNeighbors()
        {
            bool[] flags = new bool[6];

            //evaluate undefined corner values and flag bad neighbors
            if (values[0] == null) { flags[1] = flags[2] = flags[5] = true; }
            if (values[1] == null) { flags[1] = flags[3] = flags[5] = true; }
            if (values[2] == null) { flags[1] = flags[3] = flags[4] = true; }
            if (values[3] == null) { flags[1] = flags[2] = flags[4] = true; }
            if (values[4] == null) { flags[0] = flags[2] = flags[5] = true; }
            if (values[5] == null) { flags[0] = flags[3] = flags[5] = true; }
            if (values[6] == null) { flags[0] = flags[3] = flags[4] = true; }
            if (values[7] == null) { flags[0] = flags[2] = flags[4] = true; }

            //flag neighbors on faces where no isosurface intersection occurs and flag already visited neighbors
            if (!CheckIntersectionOfFace(4, 5, 6, 7) || (alreadyCalculatedNeighbors & AdjacentCubesAlreadyVisited.top)      == AdjacentCubesAlreadyVisited.top)     { flags[0] = true; }
            if (!CheckIntersectionOfFace(0, 1, 2, 3) || (alreadyCalculatedNeighbors & AdjacentCubesAlreadyVisited.bottom)   == AdjacentCubesAlreadyVisited.bottom)  { flags[1] = true; }
            if (!CheckIntersectionOfFace(0, 3, 4, 7) || (alreadyCalculatedNeighbors & AdjacentCubesAlreadyVisited.left)     == AdjacentCubesAlreadyVisited.left)    { flags[2] = true; }
            if (!CheckIntersectionOfFace(1, 2, 5, 6) || (alreadyCalculatedNeighbors & AdjacentCubesAlreadyVisited.right)    == AdjacentCubesAlreadyVisited.right)   { flags[3] = true; }
            if (!CheckIntersectionOfFace(2, 3, 6, 7) || (alreadyCalculatedNeighbors & AdjacentCubesAlreadyVisited.front)    == AdjacentCubesAlreadyVisited.front)   { flags[4] = true; }
            if (!CheckIntersectionOfFace(0, 1, 4, 5) || (alreadyCalculatedNeighbors & AdjacentCubesAlreadyVisited.back)     == AdjacentCubesAlreadyVisited.back)    { flags[5] = true; }

            return flags;
        }

        /// <summary>
        /// checks if the isosurface intersects the face specified by the indices
        /// </summary>
        /// <param name="index1">first index</param>
        /// <param name="index2">second index</param>
        /// <param name="index3">third index</param>
        /// <param name="index4">forth index</param>
        /// <returns>true if the isosurface intersects the face, false otherwise</returns>
        private bool CheckIntersectionOfFace(int index1, int index2, int index3, int index4)
        {
            if(values[index1].HasValue      //check if all have values
                && values[index2].HasValue
                && values[index3].HasValue
                && values[index4].HasValue)
            {
                bool inside = false;
                bool outside = false;

                inside |= values[index1] <= 0;
                outside |= values[index1] >= 0;
                inside |= values[index2] <= 0;
                outside |= values[index2] >= 0;
                inside |= values[index3] <= 0;
                outside |= values[index3] >= 0;
                inside |= values[index4] <= 0;
                outside |= values[index4] >= 0;

                return inside && outside;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// calculates the update values for a given neighbor cube. the neighbor cubes are indexed by 0 to 5
        /// in the order top, bottom, left, right, front, back
        /// </summary>
        /// <param name="neighbor">the neighbor</param>
        /// <returns>the update values</returns>
        public CornerValues AdjacentValues(int neighbor)
        {
            AdjacentCubesAlreadyVisited comesFrom;
            float?[] neighborValues = new float?[8];
            switch (neighbor)
            {
                case 0:                             //top:      neighbor.bottom <- this.top
                    comesFrom = AdjacentCubesAlreadyVisited.bottom;
                    neighborValues[0] = values[4];
                    neighborValues[1] = values[5];
                    neighborValues[2] = values[6];
                    neighborValues[3] = values[7];
                    break;
                case 1:                             //bottom    neighbor.top <- this.bottom
                    comesFrom = AdjacentCubesAlreadyVisited.top;
                    neighborValues[4] = values[0];
                    neighborValues[5] = values[1];
                    neighborValues[6] = values[2];
                    neighborValues[7] = values[3];
                    break;
                case 2:                             //left      neighbor.right <- this.left
                    comesFrom = AdjacentCubesAlreadyVisited.right;
                    neighborValues[1] = values[0];
                    neighborValues[2] = values[3];
                    neighborValues[5] = values[4];
                    neighborValues[6] = values[7];
                    break;
                case 3:                             //right     neighbor.left <- this.right
                    comesFrom = AdjacentCubesAlreadyVisited.left;
                    neighborValues[0] = values[1];
                    neighborValues[3] = values[2];
                    neighborValues[4] = values[5];
                    neighborValues[7] = values[6];
                    break;
                case 4:                             //front     neighbor.back <- this.front
                    comesFrom = AdjacentCubesAlreadyVisited.back;
                    neighborValues[0] = values[3];
                    neighborValues[1] = values[2];
                    neighborValues[4] = values[7];
                    neighborValues[5] = values[6];
                    break;
                case 5:                             //back      neighbor.front <- this.back
                    comesFrom = AdjacentCubesAlreadyVisited.front;
                    neighborValues[2] = values[1];
                    neighborValues[3] = values[0];
                    neighborValues[6] = values[5];
                    neighborValues[7] = values[4];
                    break;
                default:
                    throw new ArgumentOutOfRangeException("CornerValues.NeighborValues(): Argument must be in range [0,..,5]. Was " + neighbor);
            }

            return new CornerValues(comesFrom, neighborValues);
        }

        /// <summary>
        /// turns a neighbor value into an int index
        /// </summary>
        /// <param name="neighborValue"></param>
        /// <returns></returns>
        public static int toInt(AdjacentCubesAlreadyVisited neighborValue)
        {
            switch (neighborValue)
            {
                case AdjacentCubesAlreadyVisited.none:
                    throw new ArgumentException("CornerValues.toInt(): neighborValue has value none");
                case AdjacentCubesAlreadyVisited.top:
                    return 0;
                case AdjacentCubesAlreadyVisited.bottom:
                    return 1;
                case AdjacentCubesAlreadyVisited.left:
                    return 2;
                case AdjacentCubesAlreadyVisited.right:
                    return 3;
                case AdjacentCubesAlreadyVisited.front:
                    return 4;
                case AdjacentCubesAlreadyVisited.back:
                    return 5;
                default:
                    throw new ArgumentException("CornerValues.toInt(): default case can't happen");
            }
        }

        /// <summary>
        /// checks if all the corner values are not null
        /// </summary>
        /// <returns>false if there are null values, true otherwise</returns>
        public bool allValuesDefined()
        {
            for (int i = 0; i < 8; i++)
            {
                if (!values[i].HasValue)
                {
                    return false;
                }
            }
            return true;
        }
    }

    /// <summary>
    /// represents a cube in space
    /// </summary>
    private struct Cube
    {
        Vector3 back_left_bottom;
        Vector3 front_right_top;

        int xDEBUG;
        int yDEBUG;
        int zDEBUG;

        /// <summary>
        /// constructs a cube from it's corner points
        /// </summary>
        /// <param name="back_left_bottom"></param>
        /// <param name="front_right_top"></param>
        public Cube(Vector3 back_left_bottom, Vector3 front_right_top, int x, int y, int z)
        {
            this.back_left_bottom = back_left_bottom;
            this.front_right_top = front_right_top;
            this.xDEBUG = x;
            this.yDEBUG = y;
            this.zDEBUG = z;
        }

        /// <summary>
        /// constructs a cube from a point that lies within it. used for the first cube to calculate
        /// </summary>
        /// <param name="point"></param>
        public Cube(Vector3 point)
        {
            float xCube = (float)Math.Floor((point.x - xMin) / cubeSize);
            float yCube = (float)Math.Floor((point.y - yMin) / cubeSize);
            float zCube = (float)Math.Floor((point.z - zMin) / cubeSize);

            back_left_bottom.x = xCube * cubeSize + xMin;
            back_left_bottom.y = yCube * cubeSize + yMin;
            back_left_bottom.z = zCube * cubeSize + zMin;

            front_right_top.x = (xCube + 1) * cubeSize + xMin;
            front_right_top.y = (yCube + 1) * cubeSize + yMin;
            front_right_top.z = (zCube + 1) * cubeSize + zMin;

            xDEBUG = (int)xCube;
            yDEBUG = (int)yCube;
            zDEBUG = (int)zCube;
        }

        /// <summary>
        /// returns the corner values of a cube
        /// </summary>
        /// <returns></returns>
        public Vector3[] Corners
        {
            get
            {
                Vector3[] corners = new Vector3[8];
                corners[0] = back_left_bottom;
                corners[1] = new Vector3(front_right_top.x, back_left_bottom.y, back_left_bottom.z);
                corners[2] = new Vector3(front_right_top.x, front_right_top.y, back_left_bottom.z);
                corners[3] = new Vector3(back_left_bottom.x, front_right_top.y, back_left_bottom.z);
                corners[4] = new Vector3(back_left_bottom.x, back_left_bottom.y, front_right_top.z);
                corners[5] = new Vector3(front_right_top.x, back_left_bottom.y, front_right_top.z);
                corners[6] = front_right_top;
                corners[7] = new Vector3(back_left_bottom.x, front_right_top.y, front_right_top.z);
                return corners;
            }
        }

        /// <summary>
        /// returns the neighbors of a cube
        /// </summary>
        /// <returns></returns>
        public Cube[] Neighbors
        {
            get
            {
                Cube[] neighbors = new Cube[6];
                neighbors[0] = new Cube(back_left_bottom + MarchingCubes.cubeSize * Vector3.forward, front_right_top + MarchingCubes.cubeSize * Vector3.forward, xDEBUG, yDEBUG, zDEBUG + 1);
                neighbors[1] = new Cube(back_left_bottom + MarchingCubes.cubeSize * Vector3.back, front_right_top + MarchingCubes.cubeSize * Vector3.back, xDEBUG, yDEBUG, zDEBUG - 1);
                neighbors[2] = new Cube(back_left_bottom + MarchingCubes.cubeSize * Vector3.left, front_right_top + MarchingCubes.cubeSize * Vector3.left, xDEBUG - 1, yDEBUG, zDEBUG);
                neighbors[3] = new Cube(back_left_bottom + MarchingCubes.cubeSize * Vector3.right, front_right_top + MarchingCubes.cubeSize * Vector3.right, xDEBUG + 1, yDEBUG, zDEBUG);
                neighbors[4] = new Cube(back_left_bottom + MarchingCubes.cubeSize * Vector3.up, front_right_top + MarchingCubes.cubeSize * Vector3.up, xDEBUG, yDEBUG + 1, zDEBUG);
                neighbors[5] = new Cube(back_left_bottom + MarchingCubes.cubeSize * Vector3.down, front_right_top + MarchingCubes.cubeSize * Vector3.down, xDEBUG, yDEBUG - 1, zDEBUG);
                return neighbors;
            }
        }

        public override string ToString()
        {
            return "(" + xDEBUG + ", " + yDEBUG + ", " + zDEBUG + ")";
        }
    }

    #region edge table and triangle table
    /*
     * these are taken and adapted from http://paulbourke.net/geometry/polygonise/
     * */

    int[] edgeTable = {
        0x0  , 0x109, 0x203, 0x30a, 0x406, 0x50f, 0x605, 0x70c,
        0x80c, 0x905, 0xa0f, 0xb06, 0xc0a, 0xd03, 0xe09, 0xf00,
        0x190, 0x99 , 0x393, 0x29a, 0x596, 0x49f, 0x795, 0x69c,
        0x99c, 0x895, 0xb9f, 0xa96, 0xd9a, 0xc93, 0xf99, 0xe90,
        0x230, 0x339, 0x33 , 0x13a, 0x636, 0x73f, 0x435, 0x53c,
        0xa3c, 0xb35, 0x83f, 0x936, 0xe3a, 0xf33, 0xc39, 0xd30,
        0x3a0, 0x2a9, 0x1a3, 0xaa , 0x7a6, 0x6af, 0x5a5, 0x4ac,
        0xbac, 0xaa5, 0x9af, 0x8a6, 0xfaa, 0xea3, 0xda9, 0xca0,
        0x460, 0x569, 0x663, 0x76a, 0x66 , 0x16f, 0x265, 0x36c,
        0xc6c, 0xd65, 0xe6f, 0xf66, 0x86a, 0x963, 0xa69, 0xb60,
        0x5f0, 0x4f9, 0x7f3, 0x6fa, 0x1f6, 0xff , 0x3f5, 0x2fc,
        0xdfc, 0xcf5, 0xfff, 0xef6, 0x9fa, 0x8f3, 0xbf9, 0xaf0,
        0x650, 0x759, 0x453, 0x55a, 0x256, 0x35f, 0x55 , 0x15c,
        0xe5c, 0xf55, 0xc5f, 0xd56, 0xa5a, 0xb53, 0x859, 0x950,
        0x7c0, 0x6c9, 0x5c3, 0x4ca, 0x3c6, 0x2cf, 0x1c5, 0xcc ,
        0xfcc, 0xec5, 0xdcf, 0xcc6, 0xbca, 0xac3, 0x9c9, 0x8c0,
        0x8c0, 0x9c9, 0xac3, 0xbca, 0xcc6, 0xdcf, 0xec5, 0xfcc,
        0xcc , 0x1c5, 0x2cf, 0x3c6, 0x4ca, 0x5c3, 0x6c9, 0x7c0,
        0x950, 0x859, 0xb53, 0xa5a, 0xd56, 0xc5f, 0xf55, 0xe5c,
        0x15c, 0x55 , 0x35f, 0x256, 0x55a, 0x453, 0x759, 0x650,
        0xaf0, 0xbf9, 0x8f3, 0x9fa, 0xef6, 0xfff, 0xcf5, 0xdfc,
        0x2fc, 0x3f5, 0xff , 0x1f6, 0x6fa, 0x7f3, 0x4f9, 0x5f0,
        0xb60, 0xa69, 0x963, 0x86a, 0xf66, 0xe6f, 0xd65, 0xc6c,
        0x36c, 0x265, 0x16f, 0x66 , 0x76a, 0x663, 0x569, 0x460,
        0xca0, 0xda9, 0xea3, 0xfaa, 0x8a6, 0x9af, 0xaa5, 0xbac,
        0x4ac, 0x5a5, 0x6af, 0x7a6, 0xaa , 0x1a3, 0x2a9, 0x3a0,
        0xd30, 0xc39, 0xf33, 0xe3a, 0x936, 0x83f, 0xb35, 0xa3c,
        0x53c, 0x435, 0x73f, 0x636, 0x13a, 0x33 , 0x339, 0x230,
        0xe90, 0xf99, 0xc93, 0xd9a, 0xa96, 0xb9f, 0x895, 0x99c,
        0x69c, 0x795, 0x49f, 0x596, 0x29a, 0x393, 0x99 , 0x190,
        0xf00, 0xe09, 0xd03, 0xc0a, 0xb06, 0xa0f, 0x905, 0x80c,
        0x70c, 0x605, 0x50f, 0x406, 0x30a, 0x203, 0x109, 0x0
    };
    int[,] triTable =
        {{-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 8, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 1, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {1, 8, 3, 9, 8, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {1, 2, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 8, 3, 1, 2, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {9, 2, 10, 0, 2, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {2, 8, 3, 2, 10, 8, 10, 9, 8, -1, -1, -1, -1, -1, -1, -1},
        {3, 11, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 11, 2, 8, 11, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {1, 9, 0, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {1, 11, 2, 1, 9, 11, 9, 8, 11, -1, -1, -1, -1, -1, -1, -1},
        {3, 10, 1, 11, 10, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 10, 1, 0, 8, 10, 8, 11, 10, -1, -1, -1, -1, -1, -1, -1},
        {3, 9, 0, 3, 11, 9, 11, 10, 9, -1, -1, -1, -1, -1, -1, -1},
        {9, 8, 10, 10, 8, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {4, 7, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {4, 3, 0, 7, 3, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 1, 9, 8, 4, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {4, 1, 9, 4, 7, 1, 7, 3, 1, -1, -1, -1, -1, -1, -1, -1},
        {1, 2, 10, 8, 4, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {3, 4, 7, 3, 0, 4, 1, 2, 10, -1, -1, -1, -1, -1, -1, -1},
        {9, 2, 10, 9, 0, 2, 8, 4, 7, -1, -1, -1, -1, -1, -1, -1},
        {2, 10, 9, 2, 9, 7, 2, 7, 3, 7, 9, 4, -1, -1, -1, -1},
        {8, 4, 7, 3, 11, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {11, 4, 7, 11, 2, 4, 2, 0, 4, -1, -1, -1, -1, -1, -1, -1},
        {9, 0, 1, 8, 4, 7, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1},
        {4, 7, 11, 9, 4, 11, 9, 11, 2, 9, 2, 1, -1, -1, -1, -1},
        {3, 10, 1, 3, 11, 10, 7, 8, 4, -1, -1, -1, -1, -1, -1, -1},
        {1, 11, 10, 1, 4, 11, 1, 0, 4, 7, 11, 4, -1, -1, -1, -1},
        {4, 7, 8, 9, 0, 11, 9, 11, 10, 11, 0, 3, -1, -1, -1, -1},
        {4, 7, 11, 4, 11, 9, 9, 11, 10, -1, -1, -1, -1, -1, -1, -1},
        {9, 5, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {9, 5, 4, 0, 8, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 5, 4, 1, 5, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {8, 5, 4, 8, 3, 5, 3, 1, 5, -1, -1, -1, -1, -1, -1, -1},
        {1, 2, 10, 9, 5, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {3, 0, 8, 1, 2, 10, 4, 9, 5, -1, -1, -1, -1, -1, -1, -1},
        {5, 2, 10, 5, 4, 2, 4, 0, 2, -1, -1, -1, -1, -1, -1, -1},
        {2, 10, 5, 3, 2, 5, 3, 5, 4, 3, 4, 8, -1, -1, -1, -1},
        {9, 5, 4, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 11, 2, 0, 8, 11, 4, 9, 5, -1, -1, -1, -1, -1, -1, -1},
        {0, 5, 4, 0, 1, 5, 2, 3, 11, -1, -1, -1, -1, -1, -1, -1},
        {2, 1, 5, 2, 5, 8, 2, 8, 11, 4, 8, 5, -1, -1, -1, -1},
        {10, 3, 11, 10, 1, 3, 9, 5, 4, -1, -1, -1, -1, -1, -1, -1},
        {4, 9, 5, 0, 8, 1, 8, 10, 1, 8, 11, 10, -1, -1, -1, -1},
        {5, 4, 0, 5, 0, 11, 5, 11, 10, 11, 0, 3, -1, -1, -1, -1},
        {5, 4, 8, 5, 8, 10, 10, 8, 11, -1, -1, -1, -1, -1, -1, -1},
        {9, 7, 8, 5, 7, 9, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {9, 3, 0, 9, 5, 3, 5, 7, 3, -1, -1, -1, -1, -1, -1, -1},
        {0, 7, 8, 0, 1, 7, 1, 5, 7, -1, -1, -1, -1, -1, -1, -1},
        {1, 5, 3, 3, 5, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {9, 7, 8, 9, 5, 7, 10, 1, 2, -1, -1, -1, -1, -1, -1, -1},
        {10, 1, 2, 9, 5, 0, 5, 3, 0, 5, 7, 3, -1, -1, -1, -1},
        {8, 0, 2, 8, 2, 5, 8, 5, 7, 10, 5, 2, -1, -1, -1, -1},
        {2, 10, 5, 2, 5, 3, 3, 5, 7, -1, -1, -1, -1, -1, -1, -1},
        {7, 9, 5, 7, 8, 9, 3, 11, 2, -1, -1, -1, -1, -1, -1, -1},
        {9, 5, 7, 9, 7, 2, 9, 2, 0, 2, 7, 11, -1, -1, -1, -1},
        {2, 3, 11, 0, 1, 8, 1, 7, 8, 1, 5, 7, -1, -1, -1, -1},
        {11, 2, 1, 11, 1, 7, 7, 1, 5, -1, -1, -1, -1, -1, -1, -1},
        {9, 5, 8, 8, 5, 7, 10, 1, 3, 10, 3, 11, -1, -1, -1, -1},
        {5, 7, 0, 5, 0, 9, 7, 11, 0, 1, 0, 10, 11, 10, 0, -1},
        {11, 10, 0, 11, 0, 3, 10, 5, 0, 8, 0, 7, 5, 7, 0, -1},
        {11, 10, 5, 7, 11, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {10, 6, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 8, 3, 5, 10, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {9, 0, 1, 5, 10, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {1, 8, 3, 1, 9, 8, 5, 10, 6, -1, -1, -1, -1, -1, -1, -1},
        {1, 6, 5, 2, 6, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {1, 6, 5, 1, 2, 6, 3, 0, 8, -1, -1, -1, -1, -1, -1, -1},
        {9, 6, 5, 9, 0, 6, 0, 2, 6, -1, -1, -1, -1, -1, -1, -1},
        {5, 9, 8, 5, 8, 2, 5, 2, 6, 3, 2, 8, -1, -1, -1, -1},
        {2, 3, 11, 10, 6, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {11, 0, 8, 11, 2, 0, 10, 6, 5, -1, -1, -1, -1, -1, -1, -1},
        {0, 1, 9, 2, 3, 11, 5, 10, 6, -1, -1, -1, -1, -1, -1, -1},
        {5, 10, 6, 1, 9, 2, 9, 11, 2, 9, 8, 11, -1, -1, -1, -1},
        {6, 3, 11, 6, 5, 3, 5, 1, 3, -1, -1, -1, -1, -1, -1, -1},
        {0, 8, 11, 0, 11, 5, 0, 5, 1, 5, 11, 6, -1, -1, -1, -1},
        {3, 11, 6, 0, 3, 6, 0, 6, 5, 0, 5, 9, -1, -1, -1, -1},
        {6, 5, 9, 6, 9, 11, 11, 9, 8, -1, -1, -1, -1, -1, -1, -1},
        {5, 10, 6, 4, 7, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {4, 3, 0, 4, 7, 3, 6, 5, 10, -1, -1, -1, -1, -1, -1, -1},
        {1, 9, 0, 5, 10, 6, 8, 4, 7, -1, -1, -1, -1, -1, -1, -1},
        {10, 6, 5, 1, 9, 7, 1, 7, 3, 7, 9, 4, -1, -1, -1, -1},
        {6, 1, 2, 6, 5, 1, 4, 7, 8, -1, -1, -1, -1, -1, -1, -1},
        {1, 2, 5, 5, 2, 6, 3, 0, 4, 3, 4, 7, -1, -1, -1, -1},
        {8, 4, 7, 9, 0, 5, 0, 6, 5, 0, 2, 6, -1, -1, -1, -1},
        {7, 3, 9, 7, 9, 4, 3, 2, 9, 5, 9, 6, 2, 6, 9, -1},
        {3, 11, 2, 7, 8, 4, 10, 6, 5, -1, -1, -1, -1, -1, -1, -1},
        {5, 10, 6, 4, 7, 2, 4, 2, 0, 2, 7, 11, -1, -1, -1, -1},
        {0, 1, 9, 4, 7, 8, 2, 3, 11, 5, 10, 6, -1, -1, -1, -1},
        {9, 2, 1, 9, 11, 2, 9, 4, 11, 7, 11, 4, 5, 10, 6, -1},
        {8, 4, 7, 3, 11, 5, 3, 5, 1, 5, 11, 6, -1, -1, -1, -1},
        {5, 1, 11, 5, 11, 6, 1, 0, 11, 7, 11, 4, 0, 4, 11, -1},
        {0, 5, 9, 0, 6, 5, 0, 3, 6, 11, 6, 3, 8, 4, 7, -1},
        {6, 5, 9, 6, 9, 11, 4, 7, 9, 7, 11, 9, -1, -1, -1, -1},
        {10, 4, 9, 6, 4, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {4, 10, 6, 4, 9, 10, 0, 8, 3, -1, -1, -1, -1, -1, -1, -1},
        {10, 0, 1, 10, 6, 0, 6, 4, 0, -1, -1, -1, -1, -1, -1, -1},
        {8, 3, 1, 8, 1, 6, 8, 6, 4, 6, 1, 10, -1, -1, -1, -1},
        {1, 4, 9, 1, 2, 4, 2, 6, 4, -1, -1, -1, -1, -1, -1, -1},
        {3, 0, 8, 1, 2, 9, 2, 4, 9, 2, 6, 4, -1, -1, -1, -1},
        {0, 2, 4, 4, 2, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {8, 3, 2, 8, 2, 4, 4, 2, 6, -1, -1, -1, -1, -1, -1, -1},
        {10, 4, 9, 10, 6, 4, 11, 2, 3, -1, -1, -1, -1, -1, -1, -1},
        {0, 8, 2, 2, 8, 11, 4, 9, 10, 4, 10, 6, -1, -1, -1, -1},
        {3, 11, 2, 0, 1, 6, 0, 6, 4, 6, 1, 10, -1, -1, -1, -1},
        {6, 4, 1, 6, 1, 10, 4, 8, 1, 2, 1, 11, 8, 11, 1, -1},
        {9, 6, 4, 9, 3, 6, 9, 1, 3, 11, 6, 3, -1, -1, -1, -1},
        {8, 11, 1, 8, 1, 0, 11, 6, 1, 9, 1, 4, 6, 4, 1, -1},
        {3, 11, 6, 3, 6, 0, 0, 6, 4, -1, -1, -1, -1, -1, -1, -1},
        {6, 4, 8, 11, 6, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {7, 10, 6, 7, 8, 10, 8, 9, 10, -1, -1, -1, -1, -1, -1, -1},
        {0, 7, 3, 0, 10, 7, 0, 9, 10, 6, 7, 10, -1, -1, -1, -1},
        {10, 6, 7, 1, 10, 7, 1, 7, 8, 1, 8, 0, -1, -1, -1, -1},
        {10, 6, 7, 10, 7, 1, 1, 7, 3, -1, -1, -1, -1, -1, -1, -1},
        {1, 2, 6, 1, 6, 8, 1, 8, 9, 8, 6, 7, -1, -1, -1, -1},
        {2, 6, 9, 2, 9, 1, 6, 7, 9, 0, 9, 3, 7, 3, 9, -1},
        {7, 8, 0, 7, 0, 6, 6, 0, 2, -1, -1, -1, -1, -1, -1, -1},
        {7, 3, 2, 6, 7, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {2, 3, 11, 10, 6, 8, 10, 8, 9, 8, 6, 7, -1, -1, -1, -1},
        {2, 0, 7, 2, 7, 11, 0, 9, 7, 6, 7, 10, 9, 10, 7, -1},
        {1, 8, 0, 1, 7, 8, 1, 10, 7, 6, 7, 10, 2, 3, 11, -1},
        {11, 2, 1, 11, 1, 7, 10, 6, 1, 6, 7, 1, -1, -1, -1, -1},
        {8, 9, 6, 8, 6, 7, 9, 1, 6, 11, 6, 3, 1, 3, 6, -1},
        {0, 9, 1, 11, 6, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {7, 8, 0, 7, 0, 6, 3, 11, 0, 11, 6, 0, -1, -1, -1, -1},
        {7, 11, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {7, 6, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {3, 0, 8, 11, 7, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 1, 9, 11, 7, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {8, 1, 9, 8, 3, 1, 11, 7, 6, -1, -1, -1, -1, -1, -1, -1},
        {10, 1, 2, 6, 11, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {1, 2, 10, 3, 0, 8, 6, 11, 7, -1, -1, -1, -1, -1, -1, -1},
        {2, 9, 0, 2, 10, 9, 6, 11, 7, -1, -1, -1, -1, -1, -1, -1},
        {6, 11, 7, 2, 10, 3, 10, 8, 3, 10, 9, 8, -1, -1, -1, -1},
        {7, 2, 3, 6, 2, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {7, 0, 8, 7, 6, 0, 6, 2, 0, -1, -1, -1, -1, -1, -1, -1},
        {2, 7, 6, 2, 3, 7, 0, 1, 9, -1, -1, -1, -1, -1, -1, -1},
        {1, 6, 2, 1, 8, 6, 1, 9, 8, 8, 7, 6, -1, -1, -1, -1},
        {10, 7, 6, 10, 1, 7, 1, 3, 7, -1, -1, -1, -1, -1, -1, -1},
        {10, 7, 6, 1, 7, 10, 1, 8, 7, 1, 0, 8, -1, -1, -1, -1},
        {0, 3, 7, 0, 7, 10, 0, 10, 9, 6, 10, 7, -1, -1, -1, -1},
        {7, 6, 10, 7, 10, 8, 8, 10, 9, -1, -1, -1, -1, -1, -1, -1},
        {6, 8, 4, 11, 8, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {3, 6, 11, 3, 0, 6, 0, 4, 6, -1, -1, -1, -1, -1, -1, -1},
        {8, 6, 11, 8, 4, 6, 9, 0, 1, -1, -1, -1, -1, -1, -1, -1},
        {9, 4, 6, 9, 6, 3, 9, 3, 1, 11, 3, 6, -1, -1, -1, -1},
        {6, 8, 4, 6, 11, 8, 2, 10, 1, -1, -1, -1, -1, -1, -1, -1},
        {1, 2, 10, 3, 0, 11, 0, 6, 11, 0, 4, 6, -1, -1, -1, -1},
        {4, 11, 8, 4, 6, 11, 0, 2, 9, 2, 10, 9, -1, -1, -1, -1},
        {10, 9, 3, 10, 3, 2, 9, 4, 3, 11, 3, 6, 4, 6, 3, -1},
        {8, 2, 3, 8, 4, 2, 4, 6, 2, -1, -1, -1, -1, -1, -1, -1},
        {0, 4, 2, 4, 6, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {1, 9, 0, 2, 3, 4, 2, 4, 6, 4, 3, 8, -1, -1, -1, -1},
        {1, 9, 4, 1, 4, 2, 2, 4, 6, -1, -1, -1, -1, -1, -1, -1},
        {8, 1, 3, 8, 6, 1, 8, 4, 6, 6, 10, 1, -1, -1, -1, -1},
        {10, 1, 0, 10, 0, 6, 6, 0, 4, -1, -1, -1, -1, -1, -1, -1},
        {4, 6, 3, 4, 3, 8, 6, 10, 3, 0, 3, 9, 10, 9, 3, -1},
        {10, 9, 4, 6, 10, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {4, 9, 5, 7, 6, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 8, 3, 4, 9, 5, 11, 7, 6, -1, -1, -1, -1, -1, -1, -1},
        {5, 0, 1, 5, 4, 0, 7, 6, 11, -1, -1, -1, -1, -1, -1, -1},
        {11, 7, 6, 8, 3, 4, 3, 5, 4, 3, 1, 5, -1, -1, -1, -1},
        {9, 5, 4, 10, 1, 2, 7, 6, 11, -1, -1, -1, -1, -1, -1, -1},
        {6, 11, 7, 1, 2, 10, 0, 8, 3, 4, 9, 5, -1, -1, -1, -1},
        {7, 6, 11, 5, 4, 10, 4, 2, 10, 4, 0, 2, -1, -1, -1, -1},
        {3, 4, 8, 3, 5, 4, 3, 2, 5, 10, 5, 2, 11, 7, 6, -1},
        {7, 2, 3, 7, 6, 2, 5, 4, 9, -1, -1, -1, -1, -1, -1, -1},
        {9, 5, 4, 0, 8, 6, 0, 6, 2, 6, 8, 7, -1, -1, -1, -1},
        {3, 6, 2, 3, 7, 6, 1, 5, 0, 5, 4, 0, -1, -1, -1, -1},
        {6, 2, 8, 6, 8, 7, 2, 1, 8, 4, 8, 5, 1, 5, 8, -1},
        {9, 5, 4, 10, 1, 6, 1, 7, 6, 1, 3, 7, -1, -1, -1, -1},
        {1, 6, 10, 1, 7, 6, 1, 0, 7, 8, 7, 0, 9, 5, 4, -1},
        {4, 0, 10, 4, 10, 5, 0, 3, 10, 6, 10, 7, 3, 7, 10, -1},
        {7, 6, 10, 7, 10, 8, 5, 4, 10, 4, 8, 10, -1, -1, -1, -1},
        {6, 9, 5, 6, 11, 9, 11, 8, 9, -1, -1, -1, -1, -1, -1, -1},
        {3, 6, 11, 0, 6, 3, 0, 5, 6, 0, 9, 5, -1, -1, -1, -1},
        {0, 11, 8, 0, 5, 11, 0, 1, 5, 5, 6, 11, -1, -1, -1, -1},
        {6, 11, 3, 6, 3, 5, 5, 3, 1, -1, -1, -1, -1, -1, -1, -1},
        {1, 2, 10, 9, 5, 11, 9, 11, 8, 11, 5, 6, -1, -1, -1, -1},
        {0, 11, 3, 0, 6, 11, 0, 9, 6, 5, 6, 9, 1, 2, 10, -1},
        {11, 8, 5, 11, 5, 6, 8, 0, 5, 10, 5, 2, 0, 2, 5, -1},
        {6, 11, 3, 6, 3, 5, 2, 10, 3, 10, 5, 3, -1, -1, -1, -1},
        {5, 8, 9, 5, 2, 8, 5, 6, 2, 3, 8, 2, -1, -1, -1, -1},
        {9, 5, 6, 9, 6, 0, 0, 6, 2, -1, -1, -1, -1, -1, -1, -1},
        {1, 5, 8, 1, 8, 0, 5, 6, 8, 3, 8, 2, 6, 2, 8, -1},
        {1, 5, 6, 2, 1, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {1, 3, 6, 1, 6, 10, 3, 8, 6, 5, 6, 9, 8, 9, 6, -1},
        {10, 1, 0, 10, 0, 6, 9, 5, 0, 5, 6, 0, -1, -1, -1, -1},
        {0, 3, 8, 5, 6, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {10, 5, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {11, 5, 10, 7, 5, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {11, 5, 10, 11, 7, 5, 8, 3, 0, -1, -1, -1, -1, -1, -1, -1},
        {5, 11, 7, 5, 10, 11, 1, 9, 0, -1, -1, -1, -1, -1, -1, -1},
        {10, 7, 5, 10, 11, 7, 9, 8, 1, 8, 3, 1, -1, -1, -1, -1},
        {11, 1, 2, 11, 7, 1, 7, 5, 1, -1, -1, -1, -1, -1, -1, -1},
        {0, 8, 3, 1, 2, 7, 1, 7, 5, 7, 2, 11, -1, -1, -1, -1},
        {9, 7, 5, 9, 2, 7, 9, 0, 2, 2, 11, 7, -1, -1, -1, -1},
        {7, 5, 2, 7, 2, 11, 5, 9, 2, 3, 2, 8, 9, 8, 2, -1},
        {2, 5, 10, 2, 3, 5, 3, 7, 5, -1, -1, -1, -1, -1, -1, -1},
        {8, 2, 0, 8, 5, 2, 8, 7, 5, 10, 2, 5, -1, -1, -1, -1},
        {9, 0, 1, 5, 10, 3, 5, 3, 7, 3, 10, 2, -1, -1, -1, -1},
        {9, 8, 2, 9, 2, 1, 8, 7, 2, 10, 2, 5, 7, 5, 2, -1},
        {1, 3, 5, 3, 7, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 8, 7, 0, 7, 1, 1, 7, 5, -1, -1, -1, -1, -1, -1, -1},
        {9, 0, 3, 9, 3, 5, 5, 3, 7, -1, -1, -1, -1, -1, -1, -1},
        {9, 8, 7, 5, 9, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {5, 8, 4, 5, 10, 8, 10, 11, 8, -1, -1, -1, -1, -1, -1, -1},
        {5, 0, 4, 5, 11, 0, 5, 10, 11, 11, 3, 0, -1, -1, -1, -1},
        {0, 1, 9, 8, 4, 10, 8, 10, 11, 10, 4, 5, -1, -1, -1, -1},
        {10, 11, 4, 10, 4, 5, 11, 3, 4, 9, 4, 1, 3, 1, 4, -1},
        {2, 5, 1, 2, 8, 5, 2, 11, 8, 4, 5, 8, -1, -1, -1, -1},
        {0, 4, 11, 0, 11, 3, 4, 5, 11, 2, 11, 1, 5, 1, 11, -1},
        {0, 2, 5, 0, 5, 9, 2, 11, 5, 4, 5, 8, 11, 8, 5, -1},
        {9, 4, 5, 2, 11, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {2, 5, 10, 3, 5, 2, 3, 4, 5, 3, 8, 4, -1, -1, -1, -1},
        {5, 10, 2, 5, 2, 4, 4, 2, 0, -1, -1, -1, -1, -1, -1, -1},
        {3, 10, 2, 3, 5, 10, 3, 8, 5, 4, 5, 8, 0, 1, 9, -1},
        {5, 10, 2, 5, 2, 4, 1, 9, 2, 9, 4, 2, -1, -1, -1, -1},
        {8, 4, 5, 8, 5, 3, 3, 5, 1, -1, -1, -1, -1, -1, -1, -1},
        {0, 4, 5, 1, 0, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {8, 4, 5, 8, 5, 3, 9, 0, 5, 0, 3, 5, -1, -1, -1, -1},
        {9, 4, 5, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {4, 11, 7, 4, 9, 11, 9, 10, 11, -1, -1, -1, -1, -1, -1, -1},
        {0, 8, 3, 4, 9, 7, 9, 11, 7, 9, 10, 11, -1, -1, -1, -1},
        {1, 10, 11, 1, 11, 4, 1, 4, 0, 7, 4, 11, -1, -1, -1, -1},
        {3, 1, 4, 3, 4, 8, 1, 10, 4, 7, 4, 11, 10, 11, 4, -1},
        {4, 11, 7, 9, 11, 4, 9, 2, 11, 9, 1, 2, -1, -1, -1, -1},
        {9, 7, 4, 9, 11, 7, 9, 1, 11, 2, 11, 1, 0, 8, 3, -1},
        {11, 7, 4, 11, 4, 2, 2, 4, 0, -1, -1, -1, -1, -1, -1, -1},
        {11, 7, 4, 11, 4, 2, 8, 3, 4, 3, 2, 4, -1, -1, -1, -1},
        {2, 9, 10, 2, 7, 9, 2, 3, 7, 7, 4, 9, -1, -1, -1, -1},
        {9, 10, 7, 9, 7, 4, 10, 2, 7, 8, 7, 0, 2, 0, 7, -1},
        {3, 7, 10, 3, 10, 2, 7, 4, 10, 1, 10, 0, 4, 0, 10, -1},
        {1, 10, 2, 8, 7, 4, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {4, 9, 1, 4, 1, 7, 7, 1, 3, -1, -1, -1, -1, -1, -1, -1},
        {4, 9, 1, 4, 1, 7, 0, 8, 1, 8, 7, 1, -1, -1, -1, -1},
        {4, 0, 3, 7, 4, 3, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {4, 8, 7, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {9, 10, 8, 10, 11, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {3, 0, 9, 3, 9, 11, 11, 9, 10, -1, -1, -1, -1, -1, -1, -1},
        {0, 1, 10, 0, 10, 8, 8, 10, 11, -1, -1, -1, -1, -1, -1, -1},
        {3, 1, 10, 11, 3, 10, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {1, 2, 11, 1, 11, 9, 9, 11, 8, -1, -1, -1, -1, -1, -1, -1},
        {3, 0, 9, 3, 9, 11, 1, 2, 9, 2, 11, 9, -1, -1, -1, -1},
        {0, 2, 11, 8, 0, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {3, 2, 11, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {2, 3, 8, 2, 8, 10, 10, 8, 9, -1, -1, -1, -1, -1, -1, -1},
        {9, 10, 2, 0, 9, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {2, 3, 8, 2, 8, 10, 0, 1, 8, 1, 10, 8, -1, -1, -1, -1},
        {1, 10, 2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {1, 3, 8, 9, 1, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 9, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {0, 3, 8, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1},
        {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1}
    };
    #endregion

    /// <summary>
    /// triangulates a cube using its corner values
    /// code taken and adapted from http://paulbourke.net/geometry/polygonise/
    /// </summary>
    /// <param name="currentCube"></param>
    /// <param name="cornerValues"></param>
    private void Triangulate(Cube currentCube, CornerValues cornerValues)
    {
        if (!cornerValues.allValuesDefined())
        {
            return;
        }
        /*
         * Determine the index into the edge table which
         * tells us which vertices are inside of the surface
        */
        int cubeIndex = 0;
        if (cornerValues.values[0] < 0) cubeIndex |= (1 << 0);
        if (cornerValues.values[1] < 0) cubeIndex |= (1 << 1);
        if (cornerValues.values[2] < 0) cubeIndex |= (1 << 2);
        if (cornerValues.values[3] < 0) cubeIndex |= (1 << 3);
        if (cornerValues.values[4] < 0) cubeIndex |= (1 << 4);
        if (cornerValues.values[5] < 0) cubeIndex |= (1 << 5);
        if (cornerValues.values[6] < 0) cubeIndex |= (1 << 6);
        if (cornerValues.values[7] < 0) cubeIndex |= (1 << 7);

        /* Cube is entirely in/out of the surface */
        if (edgeTable[cubeIndex] == 0)
            return;

        Vector3[] corners = currentCube.Corners;
        Vector3[] verticesList = new Vector3[12];

        /* Find the vertices where the surface intersects the cube */
        if ((edgeTable[cubeIndex] & (1 << 0)) == (1 << 0))
            verticesList[0] =
               Vector3.Lerp(corners[0], corners[1], cornerValues.values[0].Value / (cornerValues.values[0].Value - cornerValues.values[1].Value));
        if ((edgeTable[cubeIndex] & (1 << 1)) == (1 << 1))
            verticesList[1] =
               Vector3.Lerp(corners[1], corners[2], cornerValues.values[1].Value / (cornerValues.values[1].Value - cornerValues.values[2].Value));
        if ((edgeTable[cubeIndex] & (1 << 2)) == (1 << 2))
            verticesList[2] =
               Vector3.Lerp(corners[2], corners[3], cornerValues.values[2].Value / (cornerValues.values[2].Value - cornerValues.values[3].Value));
        if ((edgeTable[cubeIndex] & (1 << 3)) == (1 << 3))
            verticesList[3] =
               Vector3.Lerp(corners[3], corners[0], cornerValues.values[3].Value / (cornerValues.values[3].Value - cornerValues.values[0].Value));
        if ((edgeTable[cubeIndex] & (1 << 4)) == (1 << 4))
            verticesList[4] =
               Vector3.Lerp(corners[4], corners[5], cornerValues.values[4].Value / (cornerValues.values[4].Value - cornerValues.values[5].Value));
        if ((edgeTable[cubeIndex] & (1 << 5)) == (1 << 5))
            verticesList[5] =
               Vector3.Lerp(corners[5], corners[6], cornerValues.values[5].Value / (cornerValues.values[5].Value - cornerValues.values[6].Value));
        if ((edgeTable[cubeIndex] & (1 << 6)) == (1 << 6))
            verticesList[6] =
               Vector3.Lerp(corners[6], corners[7], cornerValues.values[6].Value / (cornerValues.values[6].Value - cornerValues.values[7].Value));
        if ((edgeTable[cubeIndex] & (1 << 7)) == (1 << 7))
            verticesList[7] =
               Vector3.Lerp(corners[7], corners[4], cornerValues.values[7].Value / (cornerValues.values[7].Value - cornerValues.values[4].Value));
        if ((edgeTable[cubeIndex] & (1 << 8)) == (1 << 8))
            verticesList[8] =
               Vector3.Lerp(corners[0], corners[4], cornerValues.values[0].Value / (cornerValues.values[0].Value - cornerValues.values[4].Value));
        if ((edgeTable[cubeIndex] & (1 << 9)) == (1 << 9))
            verticesList[9] =
               Vector3.Lerp(corners[1], corners[5], cornerValues.values[1].Value / (cornerValues.values[1].Value - cornerValues.values[5].Value));
        if ((edgeTable[cubeIndex] & (1 << 10)) == (1 << 10))
            verticesList[10] =
               Vector3.Lerp(corners[2], corners[6], cornerValues.values[2].Value / (cornerValues.values[2].Value - cornerValues.values[6].Value));
        if ((edgeTable[cubeIndex] & (1 << 11)) == (1 << 11))
            verticesList[11] =
               Vector3.Lerp(corners[3], corners[7], cornerValues.values[3].Value / (cornerValues.values[3].Value - cornerValues.values[7].Value));

        /* Create the triangle */
        for (int i = 0; triTable[cubeIndex, i] != -1; i += 3)
        {
            vertices.Add(verticesList[triTable[cubeIndex, i]]);
            vertices.Add(verticesList[triTable[cubeIndex, i + 1]]);
            vertices.Add(verticesList[triTable[cubeIndex, i + 2]]);

            int trianglesCount = triangles.Count;
            triangles.Add(trianglesCount);
            triangles.Add(trianglesCount + 1);
            triangles.Add(trianglesCount + 2);
        }

        //make a submesh if the vertex count is greater than 60,000
        if(vertices.Count >= 60000)
        {
            CreateAndDisplaySubMeshAndClearLists();
        }
    }

    /// <summary>
    /// instantiates and initializes a mesh that displays the mesh given in the vertex and
    /// triangle lists so far. then clears the lists for further use.
    /// </summary>
    private void CreateAndDisplaySubMeshAndClearLists()
    {
        Assert.AreEqual(vertices.Count, triangles.Count);

        //instantiate submesh; pass vertices and triangles
        //SubMesh subMesh = Instantiate(subMeshPrefab);
        //subMesh.Display(vertices.ToArray(), triangles.ToArray());

        Extension.Log("MarchingCubes.CreateAndDisplaySubMeshandClearLists(): created submesh with "
            + vertices.Count + "  vertices and " + triangles.Count / 3 + " triangles.");

        allVertices.AddRange(vertices);
        allTriangles.AddRange(triangles);


        //clear lists
        vertices.Clear();
        triangles.Clear();
    }
}
