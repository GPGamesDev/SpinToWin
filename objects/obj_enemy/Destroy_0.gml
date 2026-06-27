obj_wheel.currentState = WHEEL_STATE.SCROLL_WAIT;
obj_Sq.currentState = TILE_STATE.BACKGROUND;

var _tileChoice = random(1);
if (obj_wheel.level == 1) _tileChoice = 1;
var _tile = obj_greenSq;
if(_tileChoice<.45) _tile = obj_redSq;
if(_tileChoice>=.45 && _tileChoice<.9) _tile = obj_blueSq;

var _newTile = instance_create_layer(x,y,"Buttons",_tile);
_newTile.currentState = TILE_STATE.DRAGGABLE;

obj_wheel.level++;

instance_destroy(myToolTip);