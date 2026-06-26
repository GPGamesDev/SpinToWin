//Redraw Tiles

for(var i=0; i<displayCount; i++){
	var _tileAngle = tileStartAngle+i*displayAngleDelta+wheelOffset;
	
	var _currentTile = (i+tileIndex+tileCount)%tileCount;
	instance_activate_object(tileArray[_currentTile]);
	tileArray[_currentTile].x = x+lengthdir_x(tileRadius,_tileAngle);
	tileArray[_currentTile].y = y+lengthdir_y(tileRadius,_tileAngle);
	tileArray[_currentTile].image_angle = point_direction(x,y,tileArray[_currentTile].x,tileArray[_currentTile].y);
}

if(displayCount>tileCount) exit;

for(var i=displayCount; i<tileCount; i++){
	var _currentTile = (i+tileIndex)%tileCount;
	instance_deactivate_object(tileArray[_currentTile]);
}