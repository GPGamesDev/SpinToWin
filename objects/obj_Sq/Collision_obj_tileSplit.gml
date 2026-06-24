if(currentState != TILE_STATE.DRAGGING) exit;

firstTileIndex = obj_wheel.tileIndex+(obj_wheel.displayCount-obj_wheel.tileHandSize)/2+other.position;

obj_wheel.tileArray[firstTileIndex].currentState = TILE_STATE.TWITCHING;
obj_wheel.tileArray[firstTileIndex+1].currentState = TILE_STATE.TWITCHING;

twitchingTiles = [obj_wheel.tileArray[firstTileIndex],obj_wheel.tileArray[firstTileIndex+1]];