image_angle += rot_spd;
if path_position == 1 && state == 0{
obj_chatbox.flag_active = true;
obj_dialogue.flag_visible = true;
rot_spd = 0;
image_angle = init_angle + cos(time/spd) * amp;
time++;
if amp_dir > 0{
amp+=0.1;
amp_dir *= 0.95;
}
if amp_dir < 0.1{
amp*=0.99;	
}

}
if state == 1{
	x+=5;
	image_angle += 5;
}