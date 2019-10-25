//init vars
var _alpha = 1;
var scaler = sin(time/squishmod)*amp;
var xscaler = (orig_image_xscale + scaler)* xdir;
var yscaler = orig_image_yscale - scaler;
//update squish vars
amp*=0.96;
time++;
//make invisible when dead
if (dead_counter >=100) _alpha = 0;
if state = player_cannon _alpha = 0;
//flash the sprite
if (flash_counter > 0)
{
shader_set(shRed);
draw_sprite_ext(sprite_index,image_index,x,y,xscaler,yscaler,draw_angle,c_white,_alpha);
shader_reset();
flash_counter --;
}
else{
//draw the sprite
draw_sprite_ext(sprite_index,image_index,x,y,xscaler,yscaler,draw_angle,c_white,_alpha);
}
