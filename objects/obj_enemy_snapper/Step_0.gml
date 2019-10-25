//explode routine
if image_index > 4 && flag_explode == true{
	image_index =4;
}

if flag_explode == true{
	explode_time++;
	
}

if explode_time == 100{
	time = 0;
	amp = 0.4;
	squishmod = 5;
	spawn_fx(obj_smoke,0,-10,5,20,sprite_height*orig_scale,sprite_width*orig_scale,0.1,1,"Player_layer",0);
	play_sound(snd_explode,false,0.5,1.2,2,100);
}
if explode_time == 180{
	spawn_fx(obj_smoke,0,-10,5,20,sprite_height*orig_scale,sprite_width*orig_scale,0.1,1,"Player_layer",1);
	play_sound(choose(snd_fart1,snd_fart2,snd_fart3),false,0.5,1.2,1,100);
	instance_destroy();
}

