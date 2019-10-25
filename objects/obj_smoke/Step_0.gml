/// @description Insert description here
// You can write your code in this editor
image_alpha = alpha_scaler*0.01;
y -= yspd;
image_angle += rot_spd;
alpha_scaler -=2;
yspd *= 0.96;
rot_spd *= 0.98;

if image_alpha < 0 {
	instance_destroy();	
}