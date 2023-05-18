Shader "Custom/Sussy"
{
Properties
    {
        _mainTex ("Albedo", 2D) = "defaulttexture" {}
        _Active ("SuS",int)=0
        _Tamanho("Lado",float)=0
          _Center("Centro",Vector)=(0,0,0,0)
          _PointRay("Ray",Vector)=(0,0,0)
    }

    SubShader
    {
        CGPROGRAM
         #pragma surface surf Lambert alpha

        struct Input {
        float2 uv_mainTex;
        float3 worldPos;
        };

        sampler2D _mainTex;

        float _Tamanho;
        int _Active;
        float2 _Center;
     float2 _PointRay;

        int isInsideSquare(float2 ponto,float2 center,float lado){
        if(ponto.x>center.x-lado && ponto.x<center.x+lado && ponto.y>center.y-lado&&ponto.y<center.y+lado ){
        return 1;
        }
        return 0;
        }

        void surf(Input IN, inout SurfaceOutput o) {

        o.Alpha=1;
        o.Albedo=float3(1,1,0);
        if(IN.worldPos.x>-1&&IN.worldPos.x<1)
        o.Albedo=float3(1,0,0);
         if(IN.worldPos.x>4&&IN.worldPos.x<6)
        o.Albedo=float3(0,1,0);
         o.Albedo = tex2D(_mainTex, IN.uv_mainTex);

        if(_Active==1){
        //IN.uv_mainTex*=7;
        //IN.uv_mainTex/=_Tamanho;
        IN.uv_mainTex.x+=5;
        
        if(isInsideSquare(IN.worldPos,_PointRay,_Tamanho)==1){
          o.Albedo = tex2D(_mainTex, IN.uv_mainTex);
          o.Alpha= tex2D(_mainTex, IN.uv_mainTex).a;
          }else discard;
          }
         
        }

        ENDCG
    }
        FallBack "Diffuse"
}