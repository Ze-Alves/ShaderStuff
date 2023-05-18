Shader "Custom/TextureStuff"
{

Properties
{
  _Text("Teixtura",2D)="defaulttexture"{}
  _TextFormat("Texture Em",2D)=""{}

}

SubShader{

CGPROGRAM
#pragma surface surf Lambert alpha

struct Input {
float2 uv_Text;
float2 uv_TextFormat;
};

sampler2D _Text;
sampler2D _TextFormat;

void surf(Input IN, inout SurfaceOutput o) {
o.Albedo=tex2D(_Text,IN.uv_Text).rgb;
o.Alpha=tex2D(_TextFormat,IN.uv_TextFormat).a;
}

ENDCG
}
FallBack "Diffuse"
}
