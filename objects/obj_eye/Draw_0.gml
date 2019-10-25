var scaler = orig_scale * Camera.zoom_level;
var squishscaler = sin(time/10)*amp;
var xscaler = scaler + squishscaler;
var yscaler = scaler - squishscaler;
//update squish vars
amp*=0.96;
time++;
draw_sprite_ext(sprite_index,image_index,x,y,xscaler,yscaler,image_angle,c_white,image_alpha);