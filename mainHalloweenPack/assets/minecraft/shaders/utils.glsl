bool isGUI(mat4 ProjMat) {
    return ProjMat[2][3] == 0.0;
}

int guiScale(mat4 ProjMat, vec2 ScreenSize) {
    return int(round(ScreenSize.x * ProjMat[0][0] / 2));
}

float parseAlpha(float valu, float time) {
	int gt = int(time * 24000);
	
	// After 12000 we fade on the top half!
	if (gt >= 12000) {
		if (valu < 0.5) {
			return 0.0;
		}
		return valu / 2;
	}
	return valu;
}

float parseLowAlpha(float valu, float time) {
	int gt = int(time * 24000);
	
	// Do not fade out the background before 12000!
	if (gt <= 12000) {
		return 1.0;
	}
	
	// If we are beyond 12000 we just fade normally
	// starting at half time. (looks better than fading
	// everything at once)
	if (valu >= 0.5) {
		return 1.0;
	}
	return valu * 2;
}