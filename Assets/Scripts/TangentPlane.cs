using System.Collections;
using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// represents a plane in space centered around a point whose orientation is defined by a normal
/// </summary>
public class TangentPlane {
    public Vector3 center { get; set; }
    public Vector3 normal { get; set; }
    public int id { get; private set; }
    private static int idCount = 0;

    /// <summary>
    /// creates a tangent plane
    /// </summary>
    /// <param name="center">the center</param>
    /// <param name="normal">the normal</param>
    public TangentPlane(Vector3 center, Vector3 normal, bool setID = true)
    {
        this.center = center;
        this.normal = normal;

        if (setID)
        {
            this.id = idCount;
            idCount++;
        }
        else
        {
            this.id = -1;
        }
    }

    /// <summary>
    /// resets the internal static id integer
    /// </summary>
    public static void ResetIDs()
    {
        idCount = 0;
    }

    public override string ToString()
    {
        return "{center: " + center.ToString() + ", normal: " + normal.ToString() + "}";
    }
}
