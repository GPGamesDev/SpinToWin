if(currentState != WHEEL_STATE.PRESPIN) exit;

if(mouse_check_button_pressed(mb_left)) initialAngle = image_angle;

charge = min(charge+chargeRate,100);