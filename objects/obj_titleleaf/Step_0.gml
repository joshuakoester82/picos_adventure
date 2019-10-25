image_angle = init_angle + cos(time/spd) * amp;
time++;
if amp_dir > 0{
amp+=0.1;
amp_dir *= 0.95;
}
if amp_dir < 0.1{
amp*=0.99;	
}


