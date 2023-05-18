using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeShaderStuff : MonoBehaviour
{

    private void OnMouseDown()
    {
        GetComponent<Renderer>().material.SetColor("_mainColor", Color.cyan);
    }

     
    // Update is called once per frame
    void Update()
    {


    }
}
