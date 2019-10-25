/// @description Insert description here
// You can write your code in this editor




if flag_hud == false{
x+=xspd;
y+=yspd;
yspd+=0.001;
yspd = min(yspd,2);
xspd*=0.99;
alpha_scaler -= 0.001;
image_alpha = alpha_scaler;
image_angle += rot_spd;
}
if (image_alpha < 0) instance_destroy();
if (y > room_height) instance_destroy();