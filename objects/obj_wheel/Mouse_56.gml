if(currentState != WHEEL_STATE.PRESPIN) exit;

currentState = WHEEL_STATE.SPINNING;

rotSpeed = charge*maxRotSpeed/100;
charge = 0;