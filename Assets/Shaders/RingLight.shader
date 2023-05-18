Shader "Custom/RingLight"
{
   Properties
    {
        _RimColor("rim color", Color) = (1,1,1,1)
         _Albedo("Albedo", 2D) = "defaulttexture" {}
         _Exponencial ("Exponencial", Range (-5, 10)) = 1
        _Color("Color",Color)=(0,0,0,0)
    }

    SubShader
    {
     //Cull off
        CGPROGRAM
            #pragma surface surf Lambert alpha:fade

        struct Input {
        float2 uv_Albedo;
        float3 viewDir;
        float2 uv_Text;
        };

        float3 _RimColor;
        sampler2D _Albedo;
        float _Exponencial;
        float4 _Color;

        void surf(Input IN, inout SurfaceOutput o) {


        float dotp=(pow(1-dot(normalize(IN.viewDir),o.Normal),_Exponencial));
        o.Emission=_RimColor*dotp;
        o.Albedo=tex2D(_Albedo,IN.uv_Albedo);
        o.Albedo=_Color*(1-dotp);
        o.Alpha =.5f;
        }

        ENDCG
    }
        FallBack "Diffuse"
}
