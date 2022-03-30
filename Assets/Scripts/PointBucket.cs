using Priority_Queue;
using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

/// <summary>
/// represents a bucket in space. It holds the points in a volumetric bounding box
/// </summary>
public class PointBucket {

#pragma warning disable 0414
    //for debug purposes
    static int bucketCount = 0;
    int bucketID;
#pragma warning restore

    //holds the points in this bucket
    public List<Vector3> Points { get; private set; }

    /// <summary>
    /// constructs a space bucket with an initial point in it
    /// </summary>
    /// <param name="initialPoint">the first point</param>
    public PointBucket(Vector3 initialPoint)
    {
        Points = new List<Vector3>();
        Points.Add(initialPoint);

        bucketID = bucketCount;
        bucketCount++;
        //Extension.Log("Spacebucket.ctor(): Creating bucket number " + bucketID + " with initial point " + initialPoint.ToString());
    }

    /// <summary>
    /// resets the internal static id integer
    /// </summary>
    public static void ResetIDs()
    {
        bucketCount = 0;
    }

    /// <summary>
    /// adds a point to this bucket
    /// </summary>
    /// <param name="point">the point to add</param>
    public void Add(Vector3 point)
    {
        Points.Add(point);
    }

    /// <summary>
    ///   adds all the points within this bucket to the passed priority queue along with
    ///   their distance from a point EXCEPT WHEN this bucket has been gathered already
    /// </summary>
    /// <param name="origin">the point to which to calculate the distance</param>
    /// <param name="priorityQueue">the priority queue where the points are inserted</param>
    public void GatherPoints(Vector3 origin, SimplePriorityQueue<Vector3> priorityQueue)
    {
        //check if this bucket has been gathered before
        if (!priorityQueue.Contains(Points[0]))
        {
            //Extension.Log("PointBucket.GatherPoints(): gathering points from bucket " + bucketID);
            foreach (Vector3 point in Points)
            {
                //Extension.Log("          putting " + point.ToString() + " into the priority queue.");
                float distance = Vector3.Distance(origin, point);
                priorityQueue.Enqueue(point, distance);
            }
        }
    }
    
    /// <summary>
    ///   copies all the points into an array starting at the passed index
    ///   returns the number of elements copied
    /// </summary>
    /// <param name="pointsArray">the array where to copy the points</param>
    /// <param name="index">the start index of the array</param>
    /// <returns>the number of points copied (/stored in this bucket)</returns>
    public int ListPoints(Vector3[] pointsArray, int index)
    {
        Points.CopyTo(pointsArray, index);
        return Points.Count;
    }

    /// <summary>
    /// checks if there is a point in this bucket which is closer to the given point than a given distance
    /// </summary>
    /// <param name="radius">the distance to check against</param>
    /// <param name="origin">the given point</param>
    /// <returns>true if there is a smaller distance between the point and a point in this bucket</returns>
    public bool IsClosestPointInBall(Vector3 center, float radius)
    {
        foreach(Vector3 point in Points)
        {
            if (Vector3.Distance(center, point) < radius)
            {
                return true;
            }
        }
        return false;
    }
}
