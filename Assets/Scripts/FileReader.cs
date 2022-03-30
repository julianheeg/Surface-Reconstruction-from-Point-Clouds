using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using UnityEngine;

public static class FileReader {
    
    private const float hardCodedTestObjectDataPointsPerEdge = 4f;
    private const float hardCodedTestObjectScale = 1f;

    public static SpatialHashmap ReadPoints(string filePath)
    {
        if (filePath == "hardCodedTestCube")
        #region test cube
        {
            SpatialHashmap points = new SpatialHashmap(0, hardCodedTestObjectScale, 0, hardCodedTestObjectScale, 0, hardCodedTestObjectScale);
            float distanceBetweenAdjacentPoints = hardCodedTestObjectScale / hardCodedTestObjectDataPointsPerEdge;

            //left and right faces
            for(float i = 0; i <= hardCodedTestObjectScale; i += distanceBetweenAdjacentPoints)
            {
                for(float j = 0; j <= hardCodedTestObjectScale; j += distanceBetweenAdjacentPoints)
                {
                    points.Insert(new Vector3(0, i, j));
                    points.Insert(new Vector3(hardCodedTestObjectScale, i, j));
                }
            }

            //front and back faces
            for (float i = distanceBetweenAdjacentPoints; i < hardCodedTestObjectScale; i += distanceBetweenAdjacentPoints)
            {
                for (float j = 0; j <= hardCodedTestObjectScale; j += distanceBetweenAdjacentPoints)
                {
                    points.Insert(new Vector3(i, 0, j));
                    points.Insert(new Vector3(i, hardCodedTestObjectScale, j));
                }
            }

            //front and back faces
            for (float i = distanceBetweenAdjacentPoints; i < hardCodedTestObjectScale; i += distanceBetweenAdjacentPoints)
            {
                for (float j = distanceBetweenAdjacentPoints; j < hardCodedTestObjectScale; j += distanceBetweenAdjacentPoints)
                {
                    points.Insert(new Vector3(i, j, 0));
                    points.Insert(new Vector3(i, j, hardCodedTestObjectScale));
                }
            }

            return points;
            #endregion
        }
        else if (filePath == "hardCodedTestPlane")
        {
            #region test plane
            SpatialHashmap points = new SpatialHashmap(0, hardCodedTestObjectScale, 0, hardCodedTestObjectScale, 0, hardCodedTestObjectScale);
            float distanceBetweenAdjacentPoints = hardCodedTestObjectScale / hardCodedTestObjectDataPointsPerEdge;

            //left and right faces
            for (float i = 0; i <= hardCodedTestObjectScale; i += distanceBetweenAdjacentPoints)
            {
                for (float j = 0; j <= hardCodedTestObjectScale; j += distanceBetweenAdjacentPoints)
                {
                    points.Insert(new Vector3(hardCodedTestObjectScale / 2f, i, j));
                }
            }


            return points;
            #endregion
        }
        else
        {
            using (StreamReader streamReader = new StreamReader(filePath))
            {
                Extension.Log("FileReader.ReadFile(): Calculating bounding box");

                //bounding box of all points
                float xMin = float.PositiveInfinity, xMax = float.NegativeInfinity;
                float yMin = float.PositiveInfinity, yMax = float.NegativeInfinity;
                float zMin = float.PositiveInfinity, zMax = float.NegativeInfinity;

                //initialize a list of all points with a capacity of 1.000.000 (arbitrary, but avoids some resizings so the program runs faster)
                List<Vector3> pointList = new List<Vector3>(1000000);
                NumberFormatInfo format = new NumberFormatInfo();
                format.NegativeSign = "-";

                //iterate over every point
                while (!streamReader.EndOfStream)
                {
                    //get (x,y,z) values
                    string line = streamReader.ReadLine();
                    string[] values = line.Split('\t', ' ');
                    try
                    {
                        float x, y, z;
                        if (filePath.EndsWith(".txt"))
                        {

                            x = float.Parse(values[0], format);
                            y = float.Parse(values[1], format);
                            z = float.Parse(values[2], format);
                        }
                        else // if (filePath.EndsWith(".pts"))
                        {
                            if (values[0] != "p")
                            {
                                continue;
                            }
                            else
                            {
                                x = float.Parse(values[1], format);
                                z = float.Parse(values[2], format);
                                y = float.Parse(values[3], format);
                            }
                        }

                        //calculate bounding box
                        xMin = x < xMin ? x : xMin;
                        xMax = x > xMax ? x : xMax;
                        yMin = y < yMin ? y : yMin;
                        yMax = y > yMax ? y : yMax;
                        zMin = z < zMin ? z : zMin;
                        zMax = z > zMax ? z : zMax;



                        pointList.Add(new Vector3(x, y, z));
                    }
                    catch (FormatException)
                    {
                        Extension.Log("FileReader.ReadFile(): values has length " + values.Length + " and has contents " + values.ToString<string>());
                        Extension.Log("FileReader.ReadFile(): one of these is not in the correct format: " + values[0] + ", " + values[1] + ", " + values[2]);
                        throw new FormatException();
                    }
                }

                //initialize data structure for holding points with determined bounding box
                Extension.Log("FileReader.ReadFile(): Creating SpatialHashmap");
                SpatialHashmap points = new SpatialHashmap(xMin, xMax, yMin, yMax, zMin, zMax);

                //insert all the points
                Extension.Log("FileReader.ReadFile(): Inserting Points");
                foreach (Vector3 point in pointList)
                {
                    points.Insert(point);
                }

                Extension.Log("FileReader.ReadFile(): Finished inserting points");

                Timer.Time("FileReader.ReadFile()", false);

                return points;
            } 
        }
        
    }
}
