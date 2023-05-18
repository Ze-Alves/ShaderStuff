Shader "Custom/CarShader"
{
      Properties
    {
        _RimColor("rim color", Color) = (1,1,1,1)
         _Albedo("Albedo", 2D) = "defaulttexture" {}
         _Exponencial ("Exponencial", Range (-5, 10)) = 1
        _Color("Color",Color)=(0,0,0,0)
        _Mult("Mult",Range(0,1))=0
         _Exponencial2 ("Exponencial2", Range (-5, 10)) = 1
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
        float _Exponencial2;
        float4 _Color;
        fixed _Mult;

        void surf(Input IN, inout SurfaceOutput o) {

        float3 up=float3(0,1,.3f);

        float dotp=saturate(pow(1-dot(normalize(IN.viewDir),o.Normal),_Exponencial));
        float dotp2=saturate(pow(1-dot(normalize(IN.viewDir),o.Normal),_Exponencial2));
        if(_Mult>dotp){
        o.Alpha =dotp;

        o.Emission=_RimColor;}
        else{
        o.Alpha =dotp2;

         o.Emission=_Color;}

        o.Albedo=tex2D(_Albedo,IN.uv_Albedo);
        //o.Albedo=_Color*(1-dotp);

        }

        ENDCG
    }
        FallBack "Diffuse"
}
