//position player on cannon
x = obj_cannonhead.x;
y = obj_cannonhead.y - obj_cannonhead.sprite_height*1.5;
// update timer
cannon_timer ++;
//allow player to bomb on out of there
var input = keyboard_check(vk_space);
if cannon_timer > 100 && input == true {
	// shoot the player out
	addxspd = 0;
	yspd = 250
	amp = 0.3;
	time = 0;
	state = player_bounce;
	rot_spd = random_range(-30,30);
	//squish cannon, play sound, create boom
	obj_cannonhead.amp = 0.5;
	obj_cannonhead.time = 0;
	play_sound(choose(snd_explode,snd_explode2,snd_explode3),false,0.5,1,1,1000);
	instance_create_depth(x,y,depth-1,obj_fx_explosion);
	cannon_timer = 0;
	// go to next level
	obj_cannonhead.alarm[0] = 100;
}



