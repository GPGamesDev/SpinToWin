with(obj_wheel){
	if(currentState != WHEEL_STATE.WAITING) exit;
	
	obj_Sq.currentState = TILE_STATE.BACKGROUND;
	obj_Sq.multiplier = 1;
	currentState = WHEEL_STATE.ENEMY_TURN;
	obj_enemy.currentState = ENEMY_STATE.ATTACKING;
}

//alarm_set(0,10);