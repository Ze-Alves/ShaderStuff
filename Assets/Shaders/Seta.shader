Shader "Custom/Seta"{
Properties
    {
        _mainTex ("Albedo", 2D) = "defaulttexture" {}
        _Instensity("Intesidade",float)=0
    }

    SubShader
    {
        CGPROGRAM
         #pragma surface surf Lambert alpha

        struct Input {
        float2 uv_mainTex;
        };

        sampler2D _mainTex;

        float _Instensity;
     
        void surf(Input IN, inout SurfaceOutput o) {

        if(_Instensity<.7f)
          IN.uv_mainTex.x+=_Time.y;

          o.Alpha= tex2D(_mainTex, IN.uv_mainTex).a;
          o.Albedo = tex2D(_mainTex, IN.uv_mainTex);
         
        }

        ENDCG
    }
        FallBack "Diffuse"
}