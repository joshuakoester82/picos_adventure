sprite_index = spr_player_bounce;
//modify squish
squishmod = 2.5;
//decay speed
addxspd *= 0.995;
yspd += grav;
if place_meeting(x,y+1,obj_block){
addxspd*=0.99;
rot_spd *=0.99;
}
// bounce around
if place_meeting(x+addxspd,y,obj_block){
	if !place_meeting(x+sign(addxspd),y,obj_block){
	x+=sign(addxspd);	
	}
	addxspd *= -0.6;
	time = 0;
	amp = min(addxspd *0.08,1)
	play_sound(snd_squeak,false,0.8,1.5,1,100);
}

if place_meeting(x,y+yspd,obj_block){
	if !place_meeting(x,y+sign(yspd),obj_block){
	y+=sign(yspd);	
	}
	yspd *= - 0.6;
	time = 0;
	amp = min(yspd *0.08,1)
	play_sound(snd_squeak,false,0.8,1.5,1,100);
}
//update position
x+=min(addxspd,15);
y+=min(yspd,15);
//spin the player
draw_angle += rot_spd;
rot_spd *=0.99;

//end state

if abs(addxspd) < 3 && abs(yspd) < 3 {
state = player_main;		
}
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

//spawn smoke
smoke_timer++;
if smoke_timer == 5{
	instance_create_layer(x,y,"Player_layer",fx_blastsmoke);
	smoke_timer = 0;
}

// silence footsteps in this state
audio_sound_gain(snd_walking,0,0)