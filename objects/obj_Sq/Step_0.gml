if(currentState != TILE_STATE.TWITCHING){
	stableX = x;
	stableY = y;
}
else{
	var _twitch = 4;
	x = stableX+random(_twitch*2)-_twitch;
	y = stableY+random(_twitch*2)-_twitch;
}

if(currentState = TILE_STATE.DRAGGING && !mouse_check_button(mb_left)){
	twitchReset();
	if(!place_meeting(x,y,obj_tileSplit)){
		currentState = TILE_STATE.DRAGGABLE;
		x=spawnLocationX;
		y=spawnLocationY;
	}
	else{
		array_insert(obj_wheel.tileArray,firstTileIndex+1,self);
		currentState = TILE_STATE.BACKGROUND;
		with(obj_wheel){ 
			tileCount++;
			tileIndex = (tileIndex+tileCount)%tileCount;
			event_user(0);
			currentState = WHEEL_STATE.PRESPIN;
			var _enemy = obj_dangerNoodle;
			if(random(1)<.75) _enemy = obj_enemy;
			with(instance_create_layer(750,450,"Instances",_enemy)){
				maxHP = floor(maxHP*(1+obj_wheel.level/4));
				currentHP = maxHP;
				damage = floor(damage*(1+obj_wheel.level/8));
			}
		}
	}
}
if(currentState = TILE_STATE.DRAGGING && !place_meeting(x,y,obj_tileSplit)){
	twitchReset()
}