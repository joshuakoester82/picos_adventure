depth = obj_player.depth +1;
// not present if cannon is active
if obj_cannonhead.flag_active == true{
	tscale = 0;
}

// move mouth when active
//
image_speed = 0;
var inst = obj_dialogue;
if flag_active == true{
	if inst.ctext != inst.ttext{
	sprite_index = spr_littleguy_talking;	
	counter++;
	if counter == 5{
		image_index = irandom(4);
		counter = 0;
	}
	}
	else{
		sprite_index = spr_littleguy_idle;
	}
}


//toggle state
if inst.flag_visible == true{
	if inst.ctext = inst.ttext{
		flag_active = false;	
	}
	if inst.ctext != inst.ttext{
		flag_active = true;	
	}
}

if inst.diag_index > array_length_1d(inst.dialogue)-1{
	inst.flag_visible = false;
	obj_chatbox.flag_active = false;
	obj_player.state = player_main;
	tscale = 0;
}

//squish
scaler += (tscale - scaler) * 0.1;
image_yscale = orig_scale * scaler;

