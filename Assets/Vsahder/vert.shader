Shader "Custom/vert"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _MainTex2 ("Texture2", 2D) = "white" {}
        _SliderPos("Slider pos",Range(-.5,.5))= 0
        _SliderOffset("Offset",Range(0,.2))= 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        Blend SrcAlpha OneMinusSrcAlpha 
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
           

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;

                float3 vertexOriginal : TEXCOORD1;
                float3 vertexWorld : TEXCOORD2;


            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            sampler2D _MainTex2;
            float4 _MainTex2_ST;
            float _SliderPos;
            float _SliderOffset;

            float3 vertPass;
            v2f vert (appdata v)
            {
                v2f o;

               

                o.vertexOriginal = v.vertex;

                 if(v.vertex.x>=_SliderPos)
                v.vertex.x=_SliderPos;
                //if(_SliderPos<0 && o.vertexOriginal.x>_SliderPos && o.vertexOriginal.x<  abs(_SliderPos)&& o.vertexOriginal.x!=_SliderPos){
                //v.vertex.z=0;
                //v.vertex.y=0;
                //}}


                o.vertexWorld = mul(unity_ObjectToWorld, v.vertex);
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
           
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = tex2D(_MainTex, i.uv);
                

                 if(i.vertexOriginal.x>=_SliderPos)
                 
                 if(i.vertexOriginal.x>=_SliderPos)
                col= float4(1,1,1,1);
                if(i.vertexOriginal.x>=_SliderPos+_SliderOffset)
                col= tex2D(_MainTex2, i.uv);

                 if(_SliderPos<0){


                 if(i.vertexOriginal.x>_SliderPos+_SliderOffset && i.vertexOriginal.x<  abs(_SliderPos-_SliderOffset))
                 discard;
                 }
                

         
                
                return col;
            }
            ENDCG
        }
    }
}