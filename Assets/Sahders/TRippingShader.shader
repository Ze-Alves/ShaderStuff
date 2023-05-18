Shader "Custom/TRippingShader"
{
Properties
    {
        _RimColor("rim color", Color) = (1,1,1,1)
         _Exponencial ("Exponencial", Range (-5, 10)) = 1
        _Color("Color",Color)=(0,0,0,0)
    }

    SubShader
    {
     //Cull off
        CGPROGRAM
            #pragma surface surf Lambert

        struct Input {
        float3 viewDir;
        };

        float3 _RimColor;
        float _Exponencial;
        float4 _Color;

        void surf(Input IN, inout SurfaceOutput o) {


        float dotp=dot(normalize(IN.viewDir),o.Normal);
        int fdotp=ceil(dotp*_Exponencial);
        if(fdotp % 2 == 0){
        o.Albedo=_RimColor;}
        else
        o.Albedo=_Color;
        }

        ENDCG
    }
        FallBack "Diffuse"
}
