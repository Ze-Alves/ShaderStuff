Shader "Hidden/Poisson"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}

         _MainTex2 ("Tex", 2D) = "white" {}
         _Slider("",Range(0,10))=0
    }
    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

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
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            sampler2D _MainTex;
            float _Slider;
            sampler2D _MainTex2;

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);

                fixed4 col2 = tex2D(_MainTex2, i.uv);
                col2.rgb=float3(0,col2.r,0);
                


                float dis= distance( i.uv , float2(0.5,0.5));

                //col2*=1-(dis*_Slider);
                col+=col2*(pow (dis*_Slider,3));
                
                
                return col;//*col2;//(col2*1-(dis*_Slider));
            }
            ENDCG
        }
    }
}
