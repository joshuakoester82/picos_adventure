alpha_scaler -= 0.01;
scaler -= 0.01;
image_alpha = alpha_scaler;
image_xscale = scaler;
image_yscale = scaler;
if alpha_scaler = 0{
instance_destroy();	
}