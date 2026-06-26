function flipperSetUp(){
	var _flipperRadius = (sprite_width/2)*1.15;
	var _flipperAngle = 33.75;

	myFlipper = instance_create_depth(x+lengthdir_x(_flipperRadius,_flipperAngle),y+lengthdir_y(_flipperRadius,_flipperAngle),depth-1,obj_flipper);

	myFlipper.startingAngle = point_direction(myFlipper.x,myFlipper.y,x,y);
	//myFlipper.image_angle = myFlipper.startingAngle;
}

function pegSetUp(){
	pegArray = [noone];
	pegRadius = 120;
	pegCount = 16;
	pegAngleDelta = 360/pegCount;

	for(var i=0; i<pegCount; i++){
		pegArray[i]=instance_create_depth(x+lengthdir_x(pegRadius,i*pegAngleDelta),y+lengthdir_y(pegRadius,i*pegAngleDelta),depth-1,obj_peg);
	}
}