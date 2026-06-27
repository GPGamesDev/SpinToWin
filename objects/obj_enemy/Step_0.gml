if(currentState = ENEMY_STATE.ATTACKING){
	attackPos -= attackStep;
	x=spawnX-1/attackPos;
	if(abs(x-spawnX)>attackDist){
		attackStep *= -1;
		obj_pizzaBoy.currentHP -= damage;
		
	}
	if(abs(x-spawnX)<attackCloseEnough && attackStep<0){
		attackStep *= -1;
		x=spawnX;
		currentState = ENEMY_STATE.WAITING;
		obj_wheel.currentState = WHEEL_STATE.PRESPIN;
		attackPos = attackStart
	}
}

if(position_meeting(mouse_x,mouse_y,self)) myToolTip.toolTipText = enemyName + "\n HP: " + string(currentHP) + "/" + string(maxHP) + "\n Damage: " + string(damage);