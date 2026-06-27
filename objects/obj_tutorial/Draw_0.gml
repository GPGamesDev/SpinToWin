var _tutorialText = "";

switch(obj_wheel.currentState){
	case WHEEL_STATE.PRESPIN:
	case WHEEL_STATE.SPINNING:
	case WHEEL_STATE.SPRINGBACK:
		_tutorialText = "Press left click to spin the pizza!  \n Hold left click to spin faster.";
	break;
	
	case WHEEL_STATE.WAITING:
	case WHEEL_STATE.ENEMY_TURN:
		_tutorialText = "Click a topping, then click the target, you or the enemy. \n Click the End Turn button when you're done.";
		if(!obj_wheel.completeRotation) _tutorialText += "\n Your pizza didn't make it all the way around!  All topping power set to 0!";
		if(obj_wheel.perfectRotation) _tutorialText += "\n PERFECT SPIN! All topping power doubled!";	
	break;
	
	case WHEEL_STATE.SCROLL_WAIT:
	case WHEEL_STATE.SCROLL_SPIN:
		_tutorialText = "You got a new topping!  Drag it to your pizza. \n You can use the scroll wheel to spin your pizza \n to find where you want to place it.";
	break;
	
	
	default:
		_tutorialText = "How are you seeing this??";
	break;
}

draw_self();
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_colour(c_white);
draw_text(x,y,_tutorialText);

draw_text(room_width-200,y,"Level: " + string(obj_wheel.level));

