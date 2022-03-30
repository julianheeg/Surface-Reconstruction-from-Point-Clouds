using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(MeshFilter), typeof(MeshRenderer))]
public class SubMesh : MonoBehaviour {
    Mesh mesh;

	// Use this for initialization
	void Awake () {
        gameObject.GetComponent<MeshFilter>().mesh = mesh = new Mesh();
    }
	
    /// <summary>
    /// deletes the mesh and displays a new mesh with given vertices and triangles
    /// </summary>
    /// <param name="vertices">the mesh's vertices</param>
    /// <param name="triangles">the mesh's triangles</param>
	public void Display(Vector3[] vertices, int[] triangles)
    {
        mesh.Clear();
        mesh.vertices = vertices;
        mesh.triangles = triangles;
    }
}
