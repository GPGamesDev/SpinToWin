springAngle = angle_difference(startingAngle,image_angle);
image_angle += springAngle*springForce;

var _collidingPeg = instance_place(x,y,obj_peg);

if(_collidingPeg == noone) exit;

var _turnDir = sign(angle_difference(image_angle,point_direction(x,y,_collidingPeg.x,_collidingPeg.y)));

while(_collidingPeg != noone){
	image_angle += _turnDir*turnStep;
	_collidingPeg = instance_place(x,y,obj_peg);
}