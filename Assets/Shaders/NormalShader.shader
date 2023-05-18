Shader "Custom/NormalShader"
{
       Properties
    {
        _Albedo("Albedo", 2D) = "defaulttexture" {}
        [Toggle]
        _ActivaNormal ("Activatee",Int)=0

        [Normal]
        _Normal("Mapa Normal",2D)=""{}

        _Normalx("NoramlX",Range(-1,1))=0
        _Normaly("NoramlY",Range(-1,1))=0
        _Normalz("NoramlZ",Range(0,1))=0

        _UVSlider("UVSlider",Range(0,5))=1
    }

    SubShader
    {
     Cull off
        CGPROGRAM
            #pragma surface surf Lambert 

        struct Input {
        float2 uv_Albedo;
        float2 uv_Normal;
        };
        
        bool _ActivaNormal;
        sampler2D _Albedo;
        sampler2D _Normal;
        float _Normalx,_Normaly,_Normalz;
        float _UVSlider;

        void surf(Input IN, inout SurfaceOutput o) {

         IN.uv_Normal*=_UVSlider;
          o.Albedo = tex2D(_Albedo,IN.uv_Albedo);
          if(_ActivaNormal){
          o.Normal=UnpackNormal(tex2D(_Normal,IN.uv_Normal));
          o.Normal*=float3(_Normalx,_Normaly,_Normalz);}
        }

        ENDCG
    }
        FallBack "Diffuse"
}