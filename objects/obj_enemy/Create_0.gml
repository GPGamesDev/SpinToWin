maxHP = 10;
currentHP = maxHP;

spawnX = x;
spawnY = y;

enum ENEMY_STATE{
	WAITING,
	ATTACKING,
}

currentState = ENEMY_STATE.WAITING;

attackStart = .6;
attackPos = attackStart;
attackStep = .01;
attackDist = 50;
attackCloseEnough = 2;
