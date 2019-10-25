x+=xspd;
y+=yspd;
yspd +=0.1;
image_alpha = ascaler;
ascaler -= 0.01;
image_angle += rot_spd;

if ascaler < 0 {
instance_destroy();	
}

