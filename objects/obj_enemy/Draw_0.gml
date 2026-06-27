draw_self();
draw_healthbar(x-75,y+10,x+75,y+60,currentHP/maxHP*100,c_black,c_blue,c_blue,0,true,true);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
draw_text(x,y+35,enemyName);