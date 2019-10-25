// go
if flag_active == true{
	instance_destroy(trigger_evil);
	image_angle += rot_spd;
	x+=xspd;
	y+=yspd;
	smoke_counter ++;
}


//spawn smoke
if smoke_counter == 5{
	with(instance_create_layer(x,y-50,"Player_layer",fx_blastsmoke)){
	depth = obj_meteor.depth +1;	
	}
	smoke_counter = 0;
}

//Touch island, destroy meteor, trigger island corruption
var inst = instance_place(x,y,obj_room_floor){
	if inst != noone{
		inst.flag_beauty = false;
		Camera.shake = 200;
		play_sound(snd_explode,false,0.5,1,1.5,100);
		var sound = choose(snd_drk_annihilate,snd_drk_consume,snd_drk_deathcomes,snd_drk_deathfollows,snd_drk_donotresist,snd_drk_iamdeath,snd_drk_ibringdeath,snd_drk_devour,snd_drk_yourdestruction);
		play_sound(sound,false,1,1,1,100);
		with(instance_create_depth(x,y,depth,obj_fx_explosion)){
		sprite_index = 	spr_explosion_1;
		}
		obj_islandparent.flag_cursed = true;
		obj_islandparent.amp = 0.5;
		obj_islandparent.time = 0;
		instance_destroy();
	}
	
}

show_debug_message(rot_spd);