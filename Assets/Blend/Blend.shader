Shader "Custom/putImg"
{
     Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}

    }
    SubShader
    {
        Tags { "RenderType"="Transparent" }

        ColorMask RB

        Pass{
            SetTexture [_MainTex] {combine texture}
        }
        
    }
    FallBack "Diffuse"
}