image_angle += rot_spd;
y -= yspd;
image_alpha -= 0.01;
if image_alpha < 0{
instance_destroy();	
}
