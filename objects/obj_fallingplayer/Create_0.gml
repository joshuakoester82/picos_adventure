depth = -100;
//vars
yspd = 0.5;
rot_spd = 1;
time = 0;
//spawn leaves
repeat 50{
	var randomx = random(room_width);
	var randomy = random(room_height);
	instance_create_depth(randomx,randomy,1,obj_miscleaf);
}

//init sounds
play_sound(music_falling,true,1,1,1,1000);
play_sound(snd_falling,false,1,1,1,100);