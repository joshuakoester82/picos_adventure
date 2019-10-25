var xscale = xscaler * sign(xspd);
draw_sprite_ext(spr_splootskull,image_index,x,y,xscale,yscaler,image_angle,c_white,1);


if invun > 0 {
shader_set(shWhite);
draw_sprite_ext(spr_splootskull,image_index,x,y,xscale,yscaler,image_angle,c_white,1);
shader_reset();
invun -= 1;
}