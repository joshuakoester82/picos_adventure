/// @description Insert description here
// You can write your code in this editor



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
with(instance_create_layer(x,y,"Enemies",obj_enemy1_corpse)){
	lasthit = other.lasthit;
	image_yscale = other.scaler;
	xspd = random_range(1.5,4) * lasthit;
	y = other.y + 30;;
	xspd = lengthdir_x(other.moveforce,lasthit);
	yspd = lengthdir_y(other.moveforce/2,lasthit)-2;
	image_xscale = other.scaler * sign(xspd);
}
var sound_freq = 1.5 - image_xscale;
play_sound(choose(snd_die1,snd_die2,snd_die3,snd_die4,snd_die5),false,sound_freq-0.1,sound_freq,3,100);
Camera.shake = 30;
instance_destroy();
}
// animate-----------------------------------------------------------------------
if place_meeting(x,y+1,obj_block){
	if (xspd != 0) sprite_index = spr_enemy1_walk;
	else sprite_index = spr_enemy1_idle;
}
else {
	sprite_index = spr_enemy1_jump;
}

//move object---------------------------------------------------------------------
x += xspd;
y += yspd;