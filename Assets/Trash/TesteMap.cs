using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TesteMap : MonoBehaviour
{
    public Sprite map;
    Texture2D maptext;
    
    void Start()
    {
        maptext = map.texture;

        
        for(int i = 0; i < maptext.width; i++)
        {
            for(int j = 0; j < maptext.height; j++)
            {
                //if (maptext.GetPixel(i, j).r > 0)
                    //Debug.Log("White"+i+j);
            }
        }
       
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
