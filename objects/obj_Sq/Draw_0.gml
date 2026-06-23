switch (currentState){
	case TILE_STATE.SELECTABLE:
		shader_set(shd_border);
		shader_set_uniform_f(upixelW,texelW);
		shader_set_uniform_f(upixelH,texelH);
		shader_set_uniform_f_array(borderColorRef,[255.,255.,0.]);
		uvs = sprite_get_uvs(sprite_index, image_index);
		shader_set_uniform_f(uni_uvs, uvs[0], uvs[1], uvs[2], uvs[3]);
	break;
	
	case TILE_STATE.SELECTED:
		shader_set(shd_border);
		shader_set_uniform_f(upixelW,texelW);
		shader_set_uniform_f(upixelH,texelH);
		shader_set_uniform_f_array(borderColorRef,[255.,0.,0.]);
	break;
}

draw_self();
shader_reset();
draw_text(x,y,string(myNumber));
