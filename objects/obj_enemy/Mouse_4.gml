if(obj_wheel.selectedTile == noone) exit;

currentHP -= min(maxHP, obj_wheel.selectedTile.damage);
obj_wheel.selectedTile.currentState = TILE_STATE.BACKGROUND;
obj_wheel.selectedTile = noone;

if(currentHP<=0) instance_destroy();