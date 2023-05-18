Shader "Custom/Shader=)"
{
Properties
{
  _mainColor("Corlor", Color) = (1,1,1,1)

  _trans("Alpha",Range(0,1))=1

  _EmissionColor("Emission",Color) =(1,1,1,1)
}

SubShader{

CGPROGRAM
#pragma surface surf Lambert alpha 

struct Input {
float2 uvMainText;



};

fixed3 _mainColor; 
fixed _trans;
fixed3 _EmissionColor;

void surf(Input IN, inout SurfaceOutput o) {
o.Albedo = _mainColor.rgb;
o.Alpha = _trans;
o.Emission= _EmissionColor.rgb;
}

ENDCG
}
FallBack "Diffuse"
}


   
    

