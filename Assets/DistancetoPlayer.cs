using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DistancetoPlayer : MonoBehaviour
{
    Transform player;
    Renderer render;

    private void Start()
    {
        render = GetComponent<Renderer>();
        player = GameObject.Find("Player").transform;
        render.material.SetVector("_Center", transform.position);
        Debug.Log(transform.position);
    }

    private void Update()
    {
        ChangeEmissive();
    }


    void ChangeEmissive()
    {
        float dis = (transform.position - player.position).magnitude/32;
        render.material.SetFloat("_Instensity", dis);

    }

}
