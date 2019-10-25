
//
amptimer--;
if amptimer == 0{
	amptimer = irandom(500);
	obj_titleleaf.amp_dir = irandom(30);
	obj_puff.amp_dir = irandom(30);
}

//
if flag_timer == true{
time++;	
}
if keyboard_check_pressed(vk_anykey) == true{
	flag_timer = true;	
	obj_aztlogo.mode = 2;
}


if time = 100{
with(obj_puff){
	path_start(path_4,4,path_action_stop,true);	
	rot_spd = 5;
	}
Camera.target = obj_peach;
Camera.target_zoom = 0.9;
Camera.zoom_spd = 0.008;
Camera.spd = 0.001;
instance_destroy(title_picos);
instance_destroy(title_adventure);

}
// turn off dialogue
if obj_dialogue.diag_index = 2 && instance_exists(obj_peach){
	obj_puff.state = 1;
	obj_chatbox.flag_active = false;
	obj_dialogue.flag_visible = false;
	obj_peach.state = 1;
}
