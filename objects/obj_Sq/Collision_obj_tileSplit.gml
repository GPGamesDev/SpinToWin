if(currentState != TILE_STATE.DRAGGING) exit;

firstTileIndex = (obj_wheel.tileIndex+(obj_wheel.displayCount-obj_wheel.tileHandSize)/2+other.position)%obj_wheel.tileCount;

if(twitchingTiles[0] != noone && twitchingTiles[0] != obj_wheel.tileArray[firstTileIndex]){
	twitchingTiles[0].currentState = TILE_STATE.BACKGROUND;
	twitchingTiles[1].currentState = TILE_STATE.BACKGROUND;
	
	with(obj_wheel) event_user(0);

	obj_wheel.tileArray[firstTileIndex].currentState = TILE_STATE.TWITCHING;
	obj_wheel.tileArray[(firstTileIndex+1)%obj_wheel.tileCount].currentState = TILE_STATE.TWITCHING;

	twitchingTiles = [obj_wheel.tileArray[firstTileIndex],obj_wheel.tileArray[(firstTileIndex+1)%obj_wheel.tileCount]];
}

if(twitchingTiles[0] == noone){
	obj_wheel.tileArray[firstTileIndex].currentState = TILE_STATE.TWITCHING;
	obj_wheel.tileArray[(firstTileIndex+1)%obj_wheel.tileCount].currentState = TILE_STATE.TWITCHING;

	twitchingTiles = [obj_wheel.tileArray[firstTileIndex],obj_wheel.tileArray[(firstTileIndex+1)%obj_wheel.tileCount]];
}