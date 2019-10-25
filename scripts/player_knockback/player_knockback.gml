var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var x_input = key_right-key_left;
var jump_input = keyboard_check_pressed(vk_space);


//update grav
yspd+=grav;
// check y collisions
if place_meeting(x,y+yspd,obj_block){
	while !place_meeting(x,y+sign(yspd),obj_block){
	y+=sign(yspd);	
	}
	yspd=0;
	xspd*=0.96;
	sprite_index = spr_player_down;
}
//check x collisions
if place_meeting(x+xspd+addxspd,y,obj_block){
	while !place_meeting(x+sign(xspd+addxspd),y,obj_block){
	x+=sign(xspd+addxspd);	
	}
	xspd=0;
	addxspd = 0;
}
//check platform collisions
if place_meeting(x,y+yspd,obj_platform_parent){
	while !place_meeting(x,y+sign(yspd),obj_platform_parent){
	y+=sign(yspd);	
	}
	yspd = 0;
}
// reduce buffer
invun_buffer --;
// update positions
x+=xspd;
y+=yspd;
draw_angle = 0;

// End state
if (invun_buffer < 1) && (HP > 0)
{
	if (jump_input !=0) yspd = -3; state = player_main; invun_buffer = 30;
	if (x_input != 0) state = player_main; invun_buffer = 30;
}


// dead
if (HP <= 0) && place_meeting(x,y+1,obj_block){
	dead_counter ++;
	if dead_counter = 100{
		alarm[0] = 120;
		alarm[1] = 100;
		image_alpha = 0;
		obj_mouth.image_alpha = 0;
		xspd=0;
		yspd=0;
		addxspd=0;
		if !instance_exists(obj_skull){
			play_sound(choose(snd_die1,snd_die2,snd_die3,snd_die4,snd_die5),false,1.8,2.5,1,1000);
			play_sound(choose(snd_fart1,snd_fart2,snd_fart3),false,0.5,2,1,1000);
			instance_create_layer(x,y-30,"Player_layer",obj_skull);
			Camera.target = obj_skull;
			spawn_fx(obj_smoke,0,0,5,10,20,20,0.5,1,"Player_layer",1);
		}
}
}