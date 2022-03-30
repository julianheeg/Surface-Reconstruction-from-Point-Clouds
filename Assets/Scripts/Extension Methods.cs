using Accord.Math;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Security;
using System.Text;
using UnityEngine;
using Vector3 = UnityEngine.Vector3;

/// <summary>
/// provides a collection of various useful methods
/// </summary>
public static class Extension {

    /// <summary>
    /// constructs a vector where all the floats are initialized to the same value
    /// </summary>
    /// <param name="value">the value that the floats should have</param>
    /// <returns>the vector</returns>
    public static Vector3 Vector3(float value)
    {
        return new Vector3(value, value, value);
    }

    public static bool UnitTest { get; set; }
    /// <summary>
    /// writes a message to Debug if not called from within a unit test. Else it writes nothing at all.
    /// </summary>
    /// <param name="message">the message to write</param>
    public static void Log(string message)
    {
        if (!UnitTest)
        {
            UnityEngine.Debug.Log(message);
        }
        else
        {
            Console.WriteLine(message);
        }
    }

    /// <summary>
    /// makes a printable string from an array
    /// </summary>
    /// <typeparam name="T">the array's base class</typeparam>
    /// <param name="array">the array to print</param>
    /// <returns>the array in string form</returns>
    public static string ToString<T>(this T[] array)
    {
        if (array.Length == 0)
        {
            return "[ ]";
        }
        else
        {
            StringBuilder stringBuilder = new StringBuilder("[" + array[0].ToString());
            for(int i = 1; i < array.Length; i++)
            {
                stringBuilder.Append(", " + array[i].ToString());
            }
            stringBuilder.Append("]");

            return stringBuilder.ToString();
        }
    }

    /// <summary>
    /// calculates the dyadic product of two three-dimensional vectors and adds it to a matrix
    /// </summary>
    /// <param name="matrix">the matrix to add the product to</param>
    /// <param name="lhs">one vector</param>
    /// <param name="rhs">the other one</param>
    public static void AddDyadicProduct(ref float[,] matrix, Vector3 lhs, Vector3 rhs)
    {
        Vector3 difference = lhs - rhs;
        for (int i = 0; i < 3; i++)
        {
            for (int j = 0; j < 3; j++)
            {
                matrix[i, j] += difference[i] * difference[j];
            }
        }
    }    
}
