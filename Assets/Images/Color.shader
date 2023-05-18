Shader "Custom/Color"
{
     Properties
    {
        _Color("Color",Color)=(0,0,0,0)
    }

    SubShader
    {
     Cull off

     ColorMask RG
        CGPROGRAM
            #pragma surface surf Lambert 


        struct Input {
        float2 uvMainTex;
        };

            float4 _Color;

        void surf(Input IN, inout SurfaceOutput o) {
          
          o.Albedo=_Color;
        }

        ENDCG
    }
        FallBack "Diffuse"
       }