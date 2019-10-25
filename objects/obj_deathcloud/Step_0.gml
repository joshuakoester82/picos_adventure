y -= yspd;
alphascaler -= 0.02;
imagescaler += 0.01;
image_xscale = imagescaler;
image_yscale = imagescaler;
image_alpha = alphascaler;
image_angle = 0;

// destroy object
if alphascaler <= 0 {
instance_destroy();	
}