// check for mouse overlap
if mode == 1{
	if(position_meeting(mouse_x, mouse_y, id)){
	    tsize = 1.5;
		if mouse_check_button_pressed(mb_left){
			if room = 0{
			audio_stop_all();
			room_goto(9);	
			}
			else{
			audio_stop_all();
			room_goto(0);	
			}
		}
	}
	else{
	    tsize = 1;
}
}
if mode == 2{
tsize = 0;	
}
// resize
size += (tsize - size) *0.1;
image_xscale = size*orig_size;
image_yscale = size*orig_size;