/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

// Random Farting
if on_screen(view_camera[0]) && fart_cooldown == 0{
	rnd_fart = irandom(100);
	if rnd_fart == 1 && HP > 0{
		xspd = 0;
		var f_offset = 96 * -image_xscale;
		spawn_fx(obj_smoke,f_offset,32,5,10,16,16,0.1,0.6,"Player_layer",2);
		play_sound(choose(snd_fart1,snd_fart2,snd_fart3),false,0.5,1.5,1,100);
		sprite_index = spr_fartguy_fart;
		fart_cooldown = 50;
	}
}
fart_cooldown --;
fart_cooldown = max(0,fart_cooldown);

//random direction
if rnd_fart == 2{
xspd = irandom_range(-1,1);	
}

// physics-----------------------------------------------------------------------
yspd += grav;
//collisions
if place_meeting(x+xspd,y,obj_block){
	while !place_meeting(x+sign(xspd),y,obj_block){
	x+=sign(xspd);	
	}
	xspd = -xspd;
}
if place_meeting(x,y+yspd,obj_block){
	while !place_meeting(x,y+sign(yspd),obj_block){
	y +=sign(yspd);	
	}
	yspd = 0;
}

// kill monster-----------------------------------------------------------------
if HP < 1 {
	var _speed = random(15) + 5;
	if flag_dead == false{
		var _path = path_start(path_deflate,_speed,path_action_stop,false);
		path_rescale(_path,1,choose(0.5,1,1.5));
	
	}
	flag_dead = true;
	sprite_index = spr_fartguy_die;
	death_counter++;
	fart_counter ++;
	image_angle += 10;
	if fart_counter == 10{
		fart_counter = 0;
			spawn_fx(obj_smoke,0,20,1,5,16,16,0.2,1,"Player_layer",2);
			play_sound(choose(snd_fart1,snd_fart2,snd_fart3),false,0.5,1.5,1,100);
	}
	if death_counter = 100{
		instance_create_layer(x,y,"Player_layer",obj_fx_explosion);
		play_sound(snd_explode2,false,0.5,1,1,100);
		Camera.shake = 50;
		instance_destroy();	
	}
}

// animate-----------------------------------------------------------------------

if fart_cooldown == 0 && HP > 0{
	if place_meeting(x,y+1,obj_block){
		if (xspd != 0) sprite_index = spr_fartguy_walk;
		else sprite_index = spr_fartguyidle;
	}
	else {
		sprite_index = spr_fartguy_die;
	}
}
if (xspd != 0) image_xscale = orig_scale * sign(xspd);
//move object---------------------------------------------------------------------
x += xspd;
y += yspd;