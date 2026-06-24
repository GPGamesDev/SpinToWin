function twitchReset(){
	if(twitchingTiles[0] == noone) exit;
	
	for(var i=0; i<2; i++){
		with(twitchingTiles[i]){
			currentState = TILE_STATE.BACKGROUND;
			x = stableX;
			y = stableY;
		}
	}
	twitchingTiles = [noone, noone];
}