Shader "Custom/SushiCutter"
{
Properties
{

_Slicer("Slicer",Range(0,10))=1
}
SubShader{

Cull off

CGPROGRAM
#pragma surface surf Lambert alpha


struct Input {
float3 worldPos;
};

fixed _Slicer;

void surf(Input IN, inout SurfaceOutput o) {
o.Albedo.r = 1;

o.Alpha=abs(IN.worldPos.y) %(_Slicer*2);
if(abs(IN.worldPos.y) %(_Slicer*2)==1)
discard;

//if(abs(IN.worldPos.y) %_Slicer >0.5f*_Slicer){
//discard;
//}
}

ENDCG
}
FallBack "Diffuse"
}