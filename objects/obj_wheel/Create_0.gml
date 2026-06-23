myFlipper = instance_create_depth(x+115,y-115,depth-1,obj_flipper);

myFlipper.startingAngle = point_direction(myFlipper.x,myFlipper.y,x,y);

pegRadius = 120;
pegCount = 16;
pegAngleDelta = 360/pegCount;
pegArray = [noone];

for(var i=0; i<pegCount; i++){
	pegArray[i]=instance_create_depth(x+lengthdir_x(pegRadius,i*pegAngleDelta+pegAngleDelta/2),y+lengthdir_y(pegRadius,i*pegAngleDelta+pegAngleDelta/2),depth-1,obj_peg);
}

rotSpeed = 0;
drag = .01;
charge = 0;
chargeRate = 1;
maxRotSpeed = 5;

tileRadius = 250;
tileCount = 50;
tileChoose = [obj_redSq, obj_blueSq, obj_greenSq];
tileIndex = 0;
tileHandSize = 5;

tileStartAngle = 270;//292.5;
tileEndAngle = 90;
tileArray = [noone];
displayAngleDelta = 22.5;
displayCount = 9;

wheelOffset = 0;
lastAngle = image_angle;

for(var i=0; i<tileCount; i++){
	tileArray[i] =  instance_create_depth(x,y,depth-1,tileChoose[i%array_length(tileChoose)]);
	tileArray[i].myNumber = i;
}

for(var i=0; i<displayCount; i++){
	var _tileAngle = tileStartAngle+i*displayAngleDelta+wheelOffset;
	
	var _currentTile = (i+tileIndex)%tileCount;
	instance_activate_object(tileArray[_currentTile]);
	tileArray[_currentTile].x = x+lengthdir_x(tileRadius,_tileAngle);
	tileArray[_currentTile].y = y+lengthdir_y(tileRadius,_tileAngle);
	tileArray[_currentTile].image_angle = point_direction(tileArray[_currentTile].x,tileArray[_currentTile].y,x,y);
}

for(var i=displayCount; i<tileCount; i++){
	var _currentTile = (i+tileIndex)%tileCount;
	instance_deactivate_object(tileArray[_currentTile]);
}
enum WHEEL_STATE{
	PRESPIN,
	SPINNING,
	SPRINGBACK,
	WAITING,
}

currentState = WHEEL_STATE.PRESPIN;

springBackCount = 0;
springBackTime = 30;
springBackAngle = 0;

selectedTile = noone;