enum TILE_STATE{
	BACKGROUND,
	SELECTABLE,
	SELECTED,
}

currentState = TILE_STATE.BACKGROUND;

scr_shaderSetUp(4);

uvs = sprite_get_uvs(sprite_index, image_index);
uni_uvs = shader_get_uniform(shd_border, "u_spriteUvs");

damage = 0;

myToolTip = instance_create_layer(x,y,"Tool_Tips",obj_toolTip,{toolTipText : tileName});

instance_deactivate_object(myToolTip);