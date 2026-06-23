if(obj_wheel.currentState != WHEEL_STATE.WAITING) exit;

switch(currentState){
		case TILE_STATE.BACKGROUND:
			//currentState = TILE_STATE.SELECTED;
		break;
		
		case TILE_STATE.SELECTED:
			currentState = TILE_STATE.SELECTABLE;
			obj_wheel.selectedTile = noone;
		break;
		
		case TILE_STATE.SELECTABLE:
			currentState = TILE_STATE.SELECTED;
			if(obj_wheel.selectedTile != noone){
				obj_wheel.selectedTile.currentState = TILE_STATE.SELECTABLE;
			}
			obj_wheel.selectedTile = self;
		break;
}