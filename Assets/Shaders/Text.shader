 Shader "Custom/Text"{
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

           
          o.Alpha= tex2D(_mainTex, IN.uv_mainTex).a-_Instensity;
          if(o.Alpha<0)
          o.Alpha=0;
           //o.Albedo = tex2D(_mainTex, IN.uv_mainTex);
          o.Emission = tex2D(_mainTex, IN.uv_mainTex)-_Instensity;
         
        }

        ENDCG
    }
        FallBack "Diffuse"
}