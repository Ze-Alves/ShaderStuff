Shader "Custom/Dissolve2"
{
     Properties
    {
        _mainTex ("Albedo", 2D) = "defaulttexture" {}
        _dissText ("Dissolve", 2D) = "defaulttexture" {}
        _Dissolveslider("Dissolve",Range(0,1.1)) = 0 
    }

    SubShader
    {


        CGPROGRAM
         #pragma surface surf Lambert addshadow


        struct Input {
            float2 uv_mainTex;
            float2 uv_dissText;
        };

        sampler2D _mainTex;
        sampler2D _dissText;
        float _Dissolveslider;

        void surf(Input IN, inout SurfaceOutput o) {

        o.Albedo=tex2D(_mainTex,IN.uv_mainTex);
        
        float3 dissT=tex2D(_dissText,IN.uv_dissText).rgb;

        clip(dissT-_Dissolveslider);


        
         
        }

        ENDCG
    }
        FallBack "Diffuse"
}
