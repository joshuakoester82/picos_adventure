//toggle the squish state--------------------------------------------------
squishbuffer --;
if squishbuffer == 0{
	squishbuffer = squishspeed;
	if flag_squishtoggle == false{
		flag_squishtoggle = true;
	}
	else flag_squishtoggle = false;
}
// squish the object----------------------------------------------------
if dist_to_player > trigger_dist{
	if flag_squishtoggle == true{
		tx = orig_xscale * 0.8;
		ty = orig_yscale * 1.2;
	}
	if flag_squishtoggle == false{
		tx = orig_xscale * 1.2;
		ty = orig_yscale * 0.8;
	}
}
else{
	if flag_squishtoggle == true{
	tx = orig_xscale * 0.5;
	ty = orig_yscale * 1.5;
	}
	if flag_squishtoggle == false{
	tx = orig_xscale * 1.5;
	ty = orig_yscale * 0.5;
	}
}
image_xscale += (tx - image_xscale) *0.1;
image_yscale += (ty - image_yscale) *0.1;
//calculate distance to player & bomb--------------------------------------------------
dist_to_player = point_distance(x,y,obj_player.x,obj_player.y);
if instance_exists(obj_bomb){
dist_to_bomb = point_distance(x,y,obj_bomb.x,obj_bomb.y);
}
if dist_to_player <= trigger_dist && spit_buffer == 0{
	with(instance_create_depth(x,y,obj_player.depth -1,obj_deathcloud)){
		yspd = random_range(0.1,1);
	}
	play_sound(snd_fart3,false,0.5,1.2,1,100);
	spit_buffer = spit_interval;
}
if dist_to_bomb <= trigger_dist && spit_buffer == 0{
	with(instance_create_depth(x,y,obj_player.depth -1,obj_deathcloud)){
		yspd = random_range(0.1,1);
	}
	play_sound(snd_fart3,false,0.5,1.2,1,100);
	spit_buffer = spit_interval;
}
spit_buffer --;
spit_buffer = clamp(spit_buffer,0,500);

//reset dist_to_bomb
dist_to_bomb = 9999;