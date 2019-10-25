if flag_cursed == true{
var color = c_purple;
}
else{
color = c_white;
}

if flasher > 0{
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_red,image_alpha);
flasher--;
}
if flasher <= 0{
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,color,image_alpha);	
}