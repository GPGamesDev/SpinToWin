//flipperSetUp();
//pegSetUp();

rotSpeed = 0;
drag = .01;
charge = 0;
chargeRate = 1;
maxRotSpeed = 5;

tileRadius = sprite_width/2+5;
tileIndex = 0;
tileHandSize = 5;

tileStartAngle = 270;//292.5;
tileEndAngle = 90;
var R = obj_redSq;
var B = obj_blueSq;
tileChoose = [R,B,R,R,R,B,R,B,B,B];
tileArray = [noone];
tileCount = array_length(tileChoose);
displayAngleDelta = 22.5;
displayCount = 9;

wheelOffset = 0;
lastAngle = image_angle;

for(var i=0; i<tileCount; i++){
	tileArray[i] =  instance_create_layer(x,y,"Buttons",tileChoose[i]);
	tileArray[i].myNumber = i;
}

event_user(0); //tile display


for(var i=0; i<4; i++){
	var _angle = -1.5*displayAngleDelta+i*displayAngleDelta;
	var _setX = x+lengthdir_x(tileRadius,_angle);
	var _setY = y+lengthdir_y(tileRadius,_angle);
	with instance_create_depth(_setX, _setY, depth,obj_tileSplit){
		image_angle = point_direction(x,y,other.x,other.y);
		position = i;
	}
		
}
enum WHEEL_STATE{
	PRESPIN,
	SPINNING,
	SPRINGBACK,
	WAITING,
	SCROLL_WAIT,
	SCROLL_SPIN,
	ENEMY_TURN
}

currentState = WHEEL_STATE.PRESPIN;

springBackCount = 0;
springBackTime = 15;
springBackAngle = 0;

selectedTile = noone;

scrollCount = 0;

instance_create_layer(room_width-32,128,"Buttons",obj_endTurnButton);

initialAngle = 0;