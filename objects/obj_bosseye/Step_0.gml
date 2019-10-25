x = (anchorx * obj_boss.image_xscale) + obj_boss.x;
y = (anchory * obj_boss.image_yscale) + obj_boss.y;
//squish with monster
if obj_boss.image_yscale < 0.1{
	image_yscale = obj_boss.image_yscale;	
}
else{
	image_yscale = init_yscale;	
}

//blink
if HP > 0 {
	var rnd = irandom(100);
	if rnd == 0{
	sprite_index = spr_blink;	
	}
}

//close eye if damaged
if HP == 1{
	sprite_index = spr_eyeclosed	
	state = "closed";
	play_sound(choose(snd_explode,snd_explode2,snd_explode3),false,0.5,1,2,1000);
	Camera.shake = 100;
	spawn_fx(obj_smoke,0,0,3,8,32,32,0.5,1.5,"Player_layer",1);
	obj_bossmouth.buffer = 150;

	HP--;
}
