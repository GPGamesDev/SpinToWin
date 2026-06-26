switch(currentState){
	case WHEEL_STATE.SPINNING:
		image_angle -= rotSpeed;
		rotSpeed = sign(rotSpeed)*max(0,abs(rotSpeed)-drag);
		
		if(rotSpeed == 0){
			currentState = WHEEL_STATE.SPRINGBACK;
			while(image_angle<0){
				image_angle+=3600;
				lastAngle+=3600;
			}
			var _distToCenter = image_angle%displayAngleDelta;
			var _travel = 0;
			if(_distToCenter<displayAngleDelta/2){
				_travel = -_distToCenter;
			}
			else{
				_travel = displayAngleDelta-_distToCenter;
			}
			var _targetAngle = image_angle+_travel;
			var _angleDelta = angle_difference(image_angle,_targetAngle);
			springBackAngle = _angleDelta/springBackTime;
		}

		/*
		if(rotSpeed == 0 && abs(myFlipper.springAngle)>2){
			rotSpeed = -(.2+.01*abs(myFlipper.springAngle));
		}
		*/	
		/*
		for(var i=0; i<pegCount; i++){
			pegArray[i].x=x+lengthdir_x(pegRadius,i*pegAngleDelta+image_angle);
			pegArray[i].y=y+lengthdir_y(pegRadius,i*pegAngleDelta+image_angle);
		}
		*/
		wheelOffset -= lastAngle-image_angle;

		if(abs(wheelOffset)>displayAngleDelta/2){
			tileIndex++;
			tileIndex = abs(tileIndex)%tileCount;
			wheelOffset += displayAngleDelta;
		}
		
		event_user(0);

	break;
	
	case WHEEL_STATE.SPRINGBACK:
		image_angle -= springBackAngle;
		wheelOffset -= lastAngle-image_angle;
		springBackCount++;

		
		if(abs(wheelOffset)>displayAngleDelta/2){
			tileIndex++;
			tileIndex = abs(tileIndex)%tileCount;
			wheelOffset += displayAngleDelta;
		}
		
		if(springBackCount>=springBackTime){
			currentState = WHEEL_STATE.WAITING;
			springBackCount=0;
			
			for(var i=(displayCount-tileHandSize)/2;i<(displayCount-tileHandSize)/2+tileHandSize;i++){
				var _currentTile = (i+tileIndex)%tileCount;
				if(tileArray[_currentTile].object_index == obj_greenSq){
					tileArray[(_currentTile+1+tileCount)%tileCount].multiplier *=2;
					tileArray[(_currentTile-1+tileCount)%tileCount].multiplier *=2;
				}
				else tileArray[_currentTile].currentState = TILE_STATE.SELECTABLE;
			}
		}
		/*
		for(var i=0; i<pegCount; i++){
			pegArray[i].x=x+lengthdir_x(pegRadius,i*pegAngleDelta+image_angle);
			pegArray[i].y=y+lengthdir_y(pegRadius,i*pegAngleDelta+image_angle);
		}
		*/
		event_user(0)
	break;
	
	case WHEEL_STATE.SCROLL_WAIT:
		if(scrollCount != 0){
			currentState = WHEEL_STATE.SCROLL_SPIN;
		}
	break;
	
	case WHEEL_STATE.SCROLL_SPIN:
		tileIndex = tileIndex - sign(scrollCount);
		tileIndex = (tileIndex+tileCount)%tileCount;
		scrollCount = scrollCount - sign(scrollCount);

		event_user(0);
		if(scrollCount == 0) currentState = WHEEL_STATE.SCROLL_WAIT;
	break;
	
	case WHEEL_STATE.PRESPIN:
		if(charge == 0) lastAngle = image_angle;
		else image_angle = initialAngle + charge/25;
		wheelOffset -= lastAngle-image_angle;
		
		event_user(0);
}