//track distance from player
dist_from_player = point_distance(x,y,obj_player.x,obj_player.y);
if (dist_from_player < hatch_range) flag_hatching = true;
//spawn a monster
if flag_hatching == true {
	spawn_countdown -=1;
	if (spawn_countdown < 0){
	var monstercount = random_range(1,3);
	spawn_fx(obj_smoke,0,0,5,10,32,32,0.5,1,"Player_layer",3);
	with(instance_create_layer(x,y,"Player_layer",obj_fx_explosion)){
		image_xscale = 0.5;
		image_yscale = 0.5;
		sprite_index = spr_explosion3;	
		
	}
	repeat monstercount{
	with(instance_create_layer(x,y,"Enemies",in_egg)){
		var scale = random_range(0.2,1.5);
		image_xscale = scale;
		image_yscale = scale;
		y -= sprite_height/2;
		scaler = scale;
		HP = (random(20)+5) * image_xscale;
		yspd = -3;
		depth = obj_player.depth -1;
	}
	}
	play_sound(choose(snd_fart1,snd_fart2,snd_fart3),false,0.5,1.5,1,100);
	instance_destroy();
}
}
//toggle squish state
squish_timer --;
if squish_timer == 0{
	if (squish_flag == true) squish_flag = false;
	else squish_flag = true;
	squish_timer = 10;
}

if (squish_flag == true){
	txscale = 1.2;
	tyscale = 0.8;
}
if (squish_flag == false){
	txscale = 0.8 ;
	tyscale = 1.2;
}

//squish the egg
if (flag_hatching == true){
image_xscale += (txscale - image_xscale) *0.05;
image_yscale += (tyscale - image_yscale) *0.05;
}
