// Rebeautify
if Beauty > target_beauty && flag_beauty == false{
	flag_beauty = true;
	play_sound(choose(snd_explode,snd_explode2,snd_explode3),false,0.5,1.5,1,100);
	var sound = choose(snd_drk_nostopit,snd_drk_leavemebe,snd_drk_groan,snd_drk_groan2,snd_drk_groan3,snd_drk_groan4,snd_drk_devour);
	play_sound(sound,false,1,1,5,100);
	//spawn butterflies
	var repeater = random(sprite_width*0.015)+3;
	var xoffset = sprite_width * 0.5;
	var yoffset = sprite_height * 0.5;
	repeat repeater{
	instance_create_depth(x+random_range(-xoffset,xoffset),y+random_range(-yoffset,yoffset),100,obj_butterfly);
	with (obj_islandparent){
		if ID == other.group_id{
		flag_cursed = false;
		//squish
		amp = 0.8;
		time = 0;
		}
		
		}
	with (obj_tentacles){
		if ID == other.group_id{
		flag_on = false;	
		}
	}
	}
	with (obj_evil_spewer){
		if ID == other.group_id{
			spawn_fx(obj_smoke,0,0,5,10,sprite_height * scaler, sprite_width * scaler,0.1,1,"Player_layer",0);
			instance_destroy();	
		}
	}
	with (obj_evil_chaser){
		spawn_fx(obj_smoke,0,0,5,10,sprite_height * scaler, sprite_width * scaler,0.1,1,"Player_layer",0);
		instance_destroy();	
	}
}

//reduce flasher
flasher --;

//pass flasher value to all relevant objects
with (obj_islandparent){
	if ID = other.group_id{
		flasher = other.flasher;
	}
}

