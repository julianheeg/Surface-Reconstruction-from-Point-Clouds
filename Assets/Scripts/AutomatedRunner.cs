using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;

public class AutomatedRunner : MonoBehaviour {

    string logFile = "Point Cloud Data/durations logfile.txt";
    int partitionsMin = 120;
    int partitionsMax = 250;
    int partitionStep = 10;
    int neighborsMin = 30;
    int neighborsMax = 30;
    int neighborsStep = 12;
    public bool run = true;

	// Use this for initialization
	void Start () {
        using (StreamWriter file = new StreamWriter(logFile))
        {
            file.WriteLine(Controller.standardFilePath);
            file.WriteLine("Part.\tNeighb.\tEstim.\tBuild\tConnect\ttotal");
        }

        if (run)
        {
            for(int currentPartitions = partitionsMin; currentPartitions <= partitionsMax; currentPartitions += partitionStep)
            {
                for(int currentNeighbors = neighborsMin; currentNeighbors <= neighborsMax; currentNeighbors += neighborsStep)
                {
                    Controller.maxPartitions = currentPartitions;
                    Controller.consideredNeighbors = currentNeighbors;
                    Controller.instance.CalculateAnew();
                    using (StreamWriter file = new StreamWriter(logFile, true))
                    {
                        file.WriteLine(Timer.ReadLog());
                    }
                }
            }
        }
    }
	
	// Update is called once per frame
	void Update () {
    }
}
