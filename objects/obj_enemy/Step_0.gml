if(currentState = ENEMY_STATE.ATTACKING){
	attackPos -= attackStep;
	x=spawnX-1/attackPos;
	if(abs(x-spawnX)>attackDist){
		attackStep *= -1;
	}
	if(abs(x-spawnX)<attackCloseEnough && attackStep<0){
		attackStep *= -1;
		x=spawnX;
		currentState = ENEMY_STATE.WAITING;
		attackPos = attackStart
	}
}