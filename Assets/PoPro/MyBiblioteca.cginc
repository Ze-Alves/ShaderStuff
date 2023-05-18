

float4 Black() {
	return float4(0, 0, 0, 1);
}


bool DrawCross(float2 pontoAtestar,float espessura) {
	if (pontoAtestar.y < 0.5 + (espessura / 2) && pontoAtestar.y > 0.5 - (espessura / 2) &&
		pontoAtestar.x < 0.5 + (espessura / 2) && pontoAtestar.x > 0.5 - (espessura / 2)) {
		return false;
		
	}
	if (pontoAtestar.y < 0.5 + (espessura / 2) && pontoAtestar.y > 0.5 - (espessura / 2)) {
		return true;
	}
	if (pontoAtestar.x < 0.5 + (espessura / 2) && pontoAtestar.x > 0.5 - (espessura / 2)) return true; 

	
	return false;
}
