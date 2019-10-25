//face player
var dir_to_player = sign(obj_player.x-x);
image_xscale = dir_to_player;

//anim
if spit_buffer > 0 {
	sprite_index = spr_flyer_spit;
}
else sprite_index = spr_enemy_flyer_fly;

//spit an egg
if on_screen(view_camera[0]){
if spit_buffer == 0{
	rnd_spit = irandom(300);
	if rnd_spit == 1{
	spit_buffer = 100;
	play_sound(choose(snd_spit1,snd_spit2,snd_spit3,snd_spit4),false,1,1.8,1.5,100);
		with(instance_create_layer(x,y,"Enemies",obj_egg_bomb)){
		depth = other.depth -1;
		xspd = random_range(1,3) * dir_to_player;
		yspd = random_range(-1,1);
		}
	}
}
}
if (spit_buffer > 0) spit_buffer --;

//kill monster
if HP < 0 {
	play_sound(choose(snd_die1,snd_die2,snd_die3,snd_die4,snd_die5),false,0.8,1,2,100);	
	spawn_fx(obj_smoke,0,0,5,30,100,100,0.4,2,"Enemies",1);
	instance_destroy();
}

