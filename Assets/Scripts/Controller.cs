using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

/// <summary>
/// class that responds to inputs of the user
/// </summary>
public class Controller : MonoBehaviour {
    public static Controller instance;

    //public static string standardFilePath = "Point Cloud Data/TestObjects/unit_cube_4.txt";
    //public static string standardFilePath = "Point Cloud Data/object1_10000.txt";
    //public static string standardFilePath = "Point Cloud Data/thesis_data/input_pts/cat10.10000.pts";
    public static string standardFilePath = "Point Cloud Data/thesis_data/input_pts/mechpart.4102.pts";
    //public static string standardFilePath = "Point Cloud Data/thesis_data/input_pts/club71.16864.pts";
    //public static string standardFilePath = "hardCodedTestCube";
    //public static string standardFilePath = "hardCodedTestPlane";
    public static float? rhoPlusDelta = float.PositiveInfinity; //0.06f;
    public static float? cubeSize = 1f / 40f;
    public static int maxPartitions = 10;      //how many buckets should be created in the biggest direction?
    public static int consideredNeighbors = 12;
    static float startingCubeSize = 1 / 40f;
    static float endCubeSize = (1 / 40f) * (1/4f);
    static float cubeSizeGap = 1/(float)Math.Sqrt(2);


    static SpatialHashmap dataStructure;
    public MarchingCubes meshPrefab;

    static Stopwatch stopWatch = new Stopwatch();

    /// <summary>
    /// initialization stuff
    /// </summary>
    void Start () {
        instance = this;
	}
    
    /// <summary>
    /// input listening stuff
    /// </summary>
    void Update () {
        if (Input.GetKeyDown(KeyCode.KeypadPlus))
        {
            consideredNeighbors++;
            //Extension.ClearLog();
            Extension.Log("Current setting: " + maxPartitions + " partitions, " + consideredNeighbors + " neighbors");
        }
        else if (Input.GetKeyDown(KeyCode.KeypadMinus))
        {
            consideredNeighbors--;
            //Extension.ClearLog();
            Extension.Log("Current setting: " + maxPartitions + " partitions, " + consideredNeighbors + " neighbors");
        }
        else if (Input.GetKeyDown(KeyCode.KeypadMultiply))
        {
            maxPartitions++;
            //Extension.ClearLog();
            Extension.Log("Current setting: " + maxPartitions + " partitions, " + consideredNeighbors + " neighbors");
        }
        else if (Input.GetKeyDown(KeyCode.KeypadDivide))
        {
            maxPartitions--;
            //Extension.ClearLog();
            Extension.Log("Current setting: " + maxPartitions + " partitions, " + consideredNeighbors + " neighbors");
        }
        if (Input.GetKeyDown(KeyCode.KeypadEnter))
        {
            CalculateAnew();
        }
    }

    public void CalculateAnew()
    {
        PointBucket.ResetIDs();
        TangentPlaneBucket.ResetIDs();
        TangentPlane.ResetIDs();
        stopWatch.Start();
        Timer.NewLog(maxPartitions, consideredNeighbors);
        Timer.StartStopWatch();
        dataStructure = FileReader.ReadPoints(standardFilePath);
        dataStructure.BuildTangentPlanes();
        stopWatch.Stop();

        Extension.Log("Finished building tangent planes with " + maxPartitions + " partitions and " + consideredNeighbors + " neighbors. Elapsed time: " + stopWatch.Elapsed);
        stopWatch.Reset();
        //Extension.Log(dataStructure.ListTangentPlanes().ToString<TangentPlane>());


        MarchingCubes mesh = Instantiate(meshPrefab);
        mesh.gameObject.transform.SetParent(gameObject.transform);
        //mesh.MarchWithoutOptimization(dataStructure);
        mesh.March(dataStructure);
        
        /*
        for (float resolution = startingCubeSize; resolution >= endCubeSize; resolution *= cubeSizeGap)
        {
            cubeSize = resolution;
            MarchingCubes mesh = Instantiate(meshPrefab);
            mesh.gameObject.transform.SetParent(gameObject.transform);
            //mesh.MarchWithoutOptimization(dataStructure);
            mesh.March(dataStructure);

            //GameObject.Destroy(mesh);
        }*/

        dataStructure = null;
    }
}
