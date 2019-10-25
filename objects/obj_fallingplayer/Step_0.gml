image_angle += rot_spd;
y+=yspd;
time++;

//Timed Events
if time == 350{
	obj_dialogue.flag_visible = true;
	obj_chatbox.flag_active = true;
}

if obj_dialogue.diag_index > array_length_1d(obj_dialogue.dialogue)-1{
	obj_dialogue.flag_visible = false;
	obj_chatbox.flag_active = false;
}

// go to first real level
if y > room_height-150 && obj_dialogue.flag_visible == false{
	obj_transition.tpercent = 1;
}
if obj_transition.percent == 1 && time > 100{
	audio_stop_all();
	room_goto(3);
}