Shader "Custom/NormalStuff"
{
Properties
{
  _mainColor("Corlor", Color) = (1,1,1,1)

  _trans("Alpha",Range(0,1))=1

  _EmissionColor("Emission",Color) =(1,1,1,1)
}

SubShader{

Cull off

CGPROGRAM
#pragma surface surf Lambert


struct Input {
float2 uvMainText;



};

fixed3 _mainColor; 
fixed _trans;
fixed3 _EmissionColor;

void surf(Input IN, inout SurfaceOutput o) {
o.Albedo = o.Normal;
if(abs(o.Normal).y>0.9f){
discard;
}
}

ENDCG
}
FallBack "Diffuse"
}