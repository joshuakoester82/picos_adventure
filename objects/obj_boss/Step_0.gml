//states
//-----------------------------on
if state == "on"{
var scaler = sin(time/50)*0.1;
image_xscale = init_xscale + scaler;
image_yscale = init_yscale - scaler;
time++;

//spikes
spike_state = 1;
//spawn enemies
spawn_timer++;
if spawn_timer = 600{
	var rnd = irandom(3);
	repeat rnd{
	instance_create_depth(x+random_range(-500,500),y+random_range(-500,500),-1000,obj_chaser_spawner);
	}
	spawn_timer = 0;
}
// trigger next phase
var count = 0;
with(obj_bosseye){
	if state == "open"{
	count++;	
	}
}
if count == 0{
	pause_timer++;
	if pause_timer == 200{
		if state_count == 2{
			with(obj_bosseye){
				HP = round(100*image_xscale);
				state = "open";	
			}
			state = "phase 3";
			pause_timer = 0;
		}
		if state_count == 0{
			state_count = 2;
			state = "phase 2";	
			pause_timer = 0;
		}
	}
}
}
//---------------------------off
if state == "off"{
	image_yscale = 0;
}
//---------------------------arriving
if state == "arriving"{
	tscale = init_yscale;	
	image_yscale += (tscale - image_yscale) * 0.1;
	if image_yscale == init_yscale{
		state = "on";	
		if boss_music == 0{
		play_sound(music_finalboss,true,1,1,5,100000);
		audio_stop_sound(snd_wind);
		}
	}
}
//-------------------------retract
if state == "phase 2"{
	//phase 2 events
	var scaler = sin(time/20)*0.1;
	image_xscale = init_xscale + scaler;
	image_yscale = init_yscale - scaler;
	time++;
	spike_state = 0;
	obj_tentacle_up.tscale = 1;
	with(obj_tentacle_attack){
		if state == 0{
			state = 1;	
		}
	}
	obj_tentacle_club.image_alpha = 1;
}
//------------------------ phase 3 - The all out phase
if state == "phase 3"{
//phase 3 events
var scaler = sin(time/50)*0.1;
image_xscale = init_xscale + scaler;
image_yscale = init_yscale - scaler;
time++;
//spikes
spike_state = 1;
//spawn enemies
spawn_timer++;
//attack tentacle
	obj_tentacle_up.tscale = 1;
	with(obj_tentacle_attack){
		if state == 0{
			state = 1;	
		}
	}
//--------------spawn the guys
if spawn_timer = 600{
	var rnd = irandom(3);
	repeat rnd{
	instance_create_depth(x+random_range(-500,500),y+random_range(-500,500),-1000,obj_chaser_spawner);
	}
	spawn_timer = 0;
	}
	// trigger phase 2
	var count = 0;
	with(obj_bosseye){
		if state == "open"{
		count++;	
		}
	}
	//----kill the boss
	if count == 0 && obj_tentacle_club.hp <=0{
		state = "dying";
	}

}
//----------------------------die
if state == "dying"{
	spike_state = 0
	death_timer++;	
	var transrate = 0.003;
	image_alpha -=transrate;
	obj_bosseye.image_alpha-=transrate;
	obj_bossmouth.image_alpha-=transrate;
	obj_tentacle_attack.image_alpha-=transrate;
	obj_tentacle_up.image_alpha-=transrate;
	obj_tentacle_club.image_alpha-=transrate;
	obj_tentacles.image_alpha-=transrate;
	//spawn fx
	spawn_fx(obj_smoke,0,0,1,10,sprite_width,sprite_height,0.1,1.5,"Player_layer",0);
	sound_timer++;
	if sound_timer == 3{
		play_sound(snd_explode,false,0.5,1.5,2,10000);
		sound_timer = 0;
	}	
	//destroy boss objects and rebeautify level
	if death_timer == 300{
	with(obj_bosseye){
		instance_destroy();	
	}
	with(obj_bossmouth){
		instance_destroy();	
	}
	
	with(obj_tentacle_up){
		instance_destroy();
	}
	with(obj_tentacle_up){
		instance_destroy();	
	}
	with(obj_boss_spike){
		instance_destroy();	
	}
	obj_room_floor.Beauty = obj_room_floor.target_beauty+1;
	spawn_fx(obj_fx_explosion,0,0,1,1,0,0,3,3,"Player_layer",1);
	audio_stop_sound(music_finalboss);
	instance_destroy();
	
	}
}

//kill plants
if state != "off" {
	var shrinkrate = 0.005;
	with(obj_flower){
		tSize-=shrinkrate;
		if image_xscale < 0.05{
			spawn_fx(obj_smoke,0,0,1,3,0,0,0.5,0.5,"Player_layer",0);
			instance_destroy();	
			obj_room_floor.Beauty--;
		}
	}
	with(obj_sprout){
		tsize-=shrinkrate;
		if image_xscale < 0.05{
			spawn_fx(obj_smoke,0,0,1,3,0,0,0.5,0.5,"Player_layer",0);
			instance_destroy();	
			obj_room_floor.Beauty--;
		}
	}
}


show_debug_message(state);
show_debug_message(state_count);
if keyboard_check_pressed(vk_f1) == true{
	state = "dying";	
}



