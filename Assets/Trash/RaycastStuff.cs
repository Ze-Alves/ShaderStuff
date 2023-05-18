using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RaycastStuff : MonoBehaviour
{

    Renderer render;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    private void Update()
    {
        Distance(transform.position, Vector3.forward);
    }
    void Distance(Vector3 targetPosition, Vector3 direction)
    {
        Ray ray = new Ray(targetPosition, direction);
        RaycastHit raycastHit;

        if (Physics.Raycast(ray, out raycastHit))
        {
            float Dis = (transform.position - raycastHit.transform.position).magnitude/100;

            render = raycastHit.transform.GetComponent<Renderer>();

            render.material.SetColor("_Color",new Color( Dis, Dis, Dis));
        }
    }
}
