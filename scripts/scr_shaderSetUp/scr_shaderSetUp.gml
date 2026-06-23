function scr_shaderSetUp(borderSize){
	upixelH = shader_get_uniform(shd_border,"pixelH");
	upixelW = shader_get_uniform(shd_border,"pixelW");
	borderColorRef = shader_get_uniform(shd_border,"borderColor");
	texelW = borderSize*texture_get_texel_width(sprite_get_texture(sprite_index,0));
	texelH = borderSize*texture_get_texel_height(sprite_get_texture(sprite_index,0));

}