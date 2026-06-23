var textWidth = string_width(toolTipText);
widthBuffer = 10;

image_xscale = (textWidth+2*widthBuffer)/sprite_get_width(sprite_index);

centerX = sprite_width/2;
centerY = sprite_height/2;