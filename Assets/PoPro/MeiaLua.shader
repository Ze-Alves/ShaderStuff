Shader "Hidden/ProPoss"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Slider("",Range(0,1))=0
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
            float4 _MainTex_TexelSize;
            float _Slider;

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = tex2D(_MainTex, i.uv);

                float2 size=float2(_MainTex_TexelSize.z,_MainTex_TexelSize.w);


                float div=size.x/size.y;

                col.r=div;
                // just invert the colors
                float2 center=float2(.5f,.5f);
                float2 DiffUV=(i.uv.x/div,i.uv.y);
                float2 disv=center-i.uv;

                disv.y/=div;



                float dis= length(disv);





                if(dis<_Slider) return float4(1,1,1,1);
                return col;
            }
            ENDCG
        }
    }
}
