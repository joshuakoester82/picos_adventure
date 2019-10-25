/// @description Main code for project
// get inputs
// apply gravity, acceleration, deceleration, etc
// check collisions 
// allow jumping
// update position
if (keyboard_check(ord("R"))) room_restart();

//------------------------------------------------------------------------ Inputs
var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var x_input = key_right-key_left;
var jump_input = keyboard_check_pressed(vk_space);
var zoom_input = mouse_wheel_up() - mouse_wheel_down();
var shoot_input = mouse_check_button(mb_left);
var bomb_input = mouse_check_button(mb_right);
//--------------------------------------------------------------------------
//Zoom
Camera.target_zoom += zoom_input*0.1;

#region Gravity
//increase jump height while holding Jump Key
if yspd < 0{
	if keyboard_check(vk_space) == true{
	yspd -= grav *0.5;
	}
}
//Gravity as normal
yspd += grav;
#endregion

//move on the x
if (x_input != 0 ) xspd+=x_acceleration*x_input;
xspd=clamp(xspd,maxx*-1,maxx);
//decay xspd
if x_input = 0{
xspd*=	x_decay;
}
addxspd *= 0.97;

// jump
if place_meeting(x,y+1,obj_block) && jump_input = true{
	amp = 0.3;
	time = 30;
	yspd = jump_str;
	play_sound(snd_jump,false,0.5,1.5,1,100);
}

#region Collisions

// check y collisions

if place_meeting(x,y+yspd,obj_block){
	while !place_meeting(x,y+sign(yspd),obj_block){
	y+=sign(yspd);	
	}
	if flag_onground = false{
	amp = min(yspd *0.1,1);
	time = 0;
	flag_onground = true;
	}
	yspd=0;
}
//check x collisions
if place_meeting(x+xspd+addxspd,y,obj_block){
	while !place_meeting(x+sign(xspd+addxspd),y,obj_block){
	x+=sign(xspd+addxspd);	
	}
	xspd=0;
	addxspd = 0;
}
//collide with platforms (y only)
if place_meeting(x,y+yspd,obj_platform_parent){
	while !place_meeting(x,y+sign(yspd),obj_platform_parent){
	y+=sign(yspd);	
	}
	yspd = 0;
}
//move platform and player with it
var inst = instance_place(x,y+1,obj_platform_parent)
if inst != noone{
inst.flag_moving = true;
addxspd = inst.xspd;
}

// set flag state to off ground (if player is off the ground)
if (!place_meeting(x,y+1,obj_block)){
flag_onground = false;	
}
#endregion
#region Animations
//state modifiers
draw_angle = 0;
squishmod = 10;
//Animations
// on the ground animations
if place_meeting(x,y+1,obj_block) && shoot_input = false{
	if sprite_index = spr_player_jump{
	play_sound(choose(snd_thud1,snd_thud2,snd_thud3),false,1,2,1,100);
	}
	image_speed = 1;
	if (x_input = 0) sprite_index = spr_player_idle; 
	else {
		xdir = x_input;
		sprite_index = spr_player_walk;
	}
}
if place_meeting(x,y+1,obj_platform_parent) && shoot_input = false{
	if sprite_index = spr_player_jump{
	play_sound(choose(snd_thud1,snd_thud2,snd_thud3),false,1,2,1,100);
	}
	image_speed = 1;
	if (x_input == 0) sprite_index = spr_player_idle; 
	else {
		xdir = x_input;
		sprite_index = spr_player_walk;
	}
}

//jumping and falling animations
if !place_meeting(x,y+1,obj_block) && !place_meeting(x,y+1,obj_platform_parent) && shoot_input = false{
	image_speed = 0;
	sprite_index = spr_player_jump;
	if (yspd > 0) image_index = 1;
	if (yspd < 0) image_index = 0;
}
//shooting animation
if shoot_input == true && !place_meeting(x,y+1,obj_block){
	sprite_index = spr_player_spit_jump;	
}
if shoot_input == true && place_meeting(x,y+1,obj_block){
	if x_input == 0{
		sprite_index = spr_player_spit_stand;
	}
	if x_input !=0{
		sprite_index = spr_player_walkshoot;
		xdir = x_input;
		image_speed = 1;
	}		
}
//bomb animation
if bomb_input == true && !place_meeting(x,y+1,obj_block){
	sprite_index = spr_player_spit_jump;
	
}
if bomb_input == true && place_meeting(x,y+1,obj_block){
	if x_input == 0{
		sprite_index = spr_player_spit_stand;
	}
	if x_input !=0{
		sprite_index = spr_player_walkshoot;
		xdir = x_input;
		image_speed = 1;
	}
	
}
#endregion
#region Sounds
//Play or silence walk sound.
if place_meeting(x,y+1,obj_block) && x_input != 0 {
var walkvolume = 1;	
}
else walkvolume = 0;
audio_sound_gain(snd_walking,walkvolume,0);
#endregion


//fall out of level
if y > room_height {
HP = 0;		
obj_transition.tpercent = 1;
dead_counter ++;
if dead_counter > 100{
	audio_stop_all();
	room_restart();
	}
}

// jump ground
if place_meeting(x,y+1,obj_block) && jump_input = true{
	yspd = jump_str;
	play_sound(snd_jump,false,0.5,1.5,1,100);
}
// jump platform
if place_meeting(x,y+1,obj_platform_parent) && jump_input = true{
	yspd = jump_str;
	play_sound(snd_jump,false,0.5,1.5,1,100);
}
//clamp HP
HP = min(HP,maxHP);
//update position
x += xspd + addxspd;
y += yspd;

