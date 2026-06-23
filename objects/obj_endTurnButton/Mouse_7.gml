with(obj_wheel){
	if(currentState != WHEEL_STATE.WAITING) exit;
	
	obj_Sq.currentState = TILE_STATE.BACKGROUND;
}

alarm_set(0,10);