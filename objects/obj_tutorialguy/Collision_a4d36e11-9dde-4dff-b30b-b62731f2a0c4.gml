
	if tscale = 1{
	//activate dialogue
	obj_dialogue.flag_visible = true;
	obj_chatbox.flag_active = true;
	// turn guy on (lol)
	if flag_active == false{
		flag_active = true;
	}
	obj_player.state = player_talking;
}

