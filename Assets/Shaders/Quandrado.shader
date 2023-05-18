Shader "Custom/Quandrado"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _Lado("TLado",float)=0
        _Centro("Centro",Vector)=(0,0,0,0)

       
    }
    SubShader
    {
     CGPROGRAM
         #pragma surface surf Lambert

        struct Input {
            float3 worldPos;
        };
        float3 _Color;
        float _Lado;
        float2 _Centro;

        int isInsideSquare(float2 ponto,float2 center,float lado){

        if(ponto.x>center.x-lado && ponto.x<center.x+lado && ponto.y>center.y-lado&&ponto.y<center.y+lado ){
        return 1;
        }
        return 0;
        }
   
   void surf(Input IN, inout SurfaceOutput o) {

   o.Albedo=_Color;

   //if(isInsideSquare(IN.worldPos.xy,_Centro,_Lado)==1)
   //o.Albedo=_Color;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
