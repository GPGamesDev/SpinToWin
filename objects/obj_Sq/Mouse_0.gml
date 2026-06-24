if(currentState != TILE_STATE.DRAGGABLE) exit;

currentState = TILE_STATE.DRAGGING;

if(mouse_check_button_pressed(mb_left)){
	mouseOffsetX = x-mouse_x;
	mouseOffsetY = y-mouse_y;
}

x=mouseOffsetX+mouse_x;
y=mouseOffsetY+mouse_y;