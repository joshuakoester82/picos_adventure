/// @description Insert description here
// You can write your code in this editor
if flag_hud == true{
	yspd+= 0.001;
	yspd = min(yspd,2);
	hudy += yspd;
	hudx += xspd;
	xspd *= 0.95;
	alpha_scaler -= 0.01;
	hudrot +=rot_spd;
	draw_sprite_ext(spr_leaf,-1,hudx,hudy,hudscale,hudscale,hudrot,c_white,alpha_scaler);
	if image_alpha < 0{
		instance_destroy();	
	}
}