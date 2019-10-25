//squish
var _alpha = 1;
var scaler = sin(time/squishmod)*amp;
var xscaler = (orig_scale + scaler);
var yscaler = orig_scale - scaler;
//update squish vars
amp*=0.96;
time++;
//draw the sprite
draw_sprite_ext(sprite_index,image_index,x,y,xscaler,yscaler,image_angle,c_white,_alpha);
depth = obj_player.depth -1;