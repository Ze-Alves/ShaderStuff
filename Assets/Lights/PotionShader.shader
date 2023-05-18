Shader "Custom/PotionShader"
{
    Properties
    {
        
    }

    SubShader
    {
     Cull off
        CGPROGRAM
            #pragma surface surf Lambert 


        struct Input {
        float2 uvMainTex;
        };

      

        void surf(Input IN, inout SurfaceOutput o) {
          o.Albedo.r=1;
        }

        ENDCG
    }
        FallBack "Diffuse"
        }