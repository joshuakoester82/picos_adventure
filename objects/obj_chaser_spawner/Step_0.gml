time++;
image_alpha += 0.005;
if image_alpha == 1{
	instance_create_depth(x,y,depth,obj_evil_chaser);
	instance_destroy();
}
image_xscale = 0.3;
image_yscale = 0.3;