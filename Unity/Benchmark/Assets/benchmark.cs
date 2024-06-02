using System.Collections;
using UnityEngine;

public class Benchmark : MonoBehaviour
{
    public GameObject cubePrefab;

    private int cubes = 0;
    private float startTime;
    private float endTime;

    private void Start()
    {
        // Application.targetFrameRate = 60;
        StartBenchmark();
    }

    private void StartBenchmark()
    {
        Debug.Log("Starting benchmark...");
        startTime = Time.realtimeSinceStartup;
        StartCoroutine(SpawnCubesCoroutine());
    }

    private IEnumerator SpawnCubesCoroutine()
    {
        while (cubes < 500 || (1.0f / Time.deltaTime) >= 60)
        {
            SpawnCube();
            yield return new WaitForSeconds(0.01f);
        }

        Debug.Log("FPS dropped below 60 FPS");
        endTime = Time.realtimeSinceStartup;
        float elapsed_time = (endTime - startTime);
        Debug.Log("Benchmark completed in " + elapsed_time + " seconds.");
    }

    private void SpawnCube()
    {
        GameObject instance = Instantiate(cubePrefab);
        float x = Random.Range(-5f, 5f);
        float z = Random.Range(-5f, 5f);
        instance.transform.position = new Vector3(x, 0, z);
        cubes++;

        MonitorPerformance();
    }

    private void MonitorPerformance()
    {
        Debug.Log("Cubes: " + cubes);
        Debug.Log("FPS : " + (1.0f / Time.deltaTime));
    }
}
