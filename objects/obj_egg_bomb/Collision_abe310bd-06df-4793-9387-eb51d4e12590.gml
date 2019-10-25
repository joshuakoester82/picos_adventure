
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

	play_sound(choose(snd_explode,snd_explode2,snd_explode3),false,0.5,1.5,1,100);
	instance_destroy();
	Camera.shake = 60;

