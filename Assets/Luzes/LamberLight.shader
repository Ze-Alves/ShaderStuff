Shader "Custom/LamberLight"
{
   Properties{
   
   _Color("Cor",Color)=(0,0,0,0)

        
    }

    SubShader
    {
     Cull off
        CGPROGRAM
            #pragma surface surf LambertCopia 


        struct Input {
        float2 uvMainTex;
        };

        fixed4 _Color;

      half4 LightingLambertCopia(SurfaceOutput s,half3 lightdir,half atten){

      float dotp=dot(lightdir,s.Normal);



      half4 result;
      result.rgb=s.Albedo * _LightColor0.rgb * dotp;

      result.a=s.Alpha;
      
      return result;
      }

        void surf(Input IN, inout SurfaceOutput o) {
          
        }

        ENDCG
    }
        FallBack "Diffuse"
        }