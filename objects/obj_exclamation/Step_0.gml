//bounce
var scaler = sin(time/10)*amp;
image_xscale = 1 + scaler;
image_yscale = 1 - scaler;
amp *= 0.96;
time ++
trans -= 0.01;
image_alpha = trans;
if trans < 0 {
	instance_destroy();	
}