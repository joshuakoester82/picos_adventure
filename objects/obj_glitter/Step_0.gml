y+= 1;
image_angle += rot_spd;
alpha -=0.01;
if alpha <= 0{
	instance_destroy();	
}
image_alpha = alpha;
