using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using UnityEngine;

public static class Timer {
    static Stopwatch methodStopWatch = new Stopwatch();
    static Stopwatch totalStopWatch = new Stopwatch();

    static StringBuilder log = new StringBuilder();

    /// <summary>
    /// resets and starts an internal stopwatch
    /// </summary>
    public static void StartStopWatch()
    {
        methodStopWatch.Reset();
        methodStopWatch.Start();
    }

    /// <summary>
    /// stops the stopwatch, logs the passed time span and restarts the stopwatch
    /// </summary>
    /// <param name="methodName"></param>
    public static void Time(string methodName, bool tracked)
    {
        methodStopWatch.Stop();
        Extension.Log("Extension.Time(): method " + methodName + " took " + methodStopWatch.Elapsed + " to complete");
        if (tracked)
        {
            log.Append("\t" + methodStopWatch.ElapsedMilliseconds / 1000 + "." + totalStopWatch.ElapsedMilliseconds % 1000 / 100 + "s");
        }
        StartStopWatch();
    }

    /// <summary>
    /// resets the log
    /// </summary>
    public static void NewLog(int partitions, int neighbors)
    {
        log = new StringBuilder(partitions + "\t" + neighbors);
        totalStopWatch.Start();
    }

    /// <summary>
    /// returns the log
    /// </summary>
    /// <returns></returns>
    public static string ReadLog()
    {
        totalStopWatch.Stop();
        log.Append("\t" + totalStopWatch.ElapsedMilliseconds / 1000 + "." + totalStopWatch.ElapsedMilliseconds % 1000 / 100 + "s");
        totalStopWatch.Reset();
        return log.ToString();
    }
}
