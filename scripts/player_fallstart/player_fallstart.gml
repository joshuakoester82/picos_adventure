//image
sprite_index = spr_player_bounce;
//spawn smoke
smoke_timer++;
if smoke_timer == 5{
	instance_create_layer(x,y,"Player_layer",fx_blastsmoke);
	smoke_timer = 0;
}

// silence footsteps in this state
audio_sound_gain(snd_walking,0,0)

if place_meeting(x,y+yspd,obj_block){
	if !place_meeting(x,y+sign(yspd),obj_block){
	y+=sign(yspd);	
	draw_angle = 0;
	}
	state = player_bounce;
	yspd = 10;
	play_sound(snd_thud1,false,0.8,1.5,1,100);
	Camera.shake = 20;
	spawn_fx(obj_smoke,0,0,3,10,32,32,0.2,1,"Player_layer",1);
}

//update position
x+=min(addxspd,15);
y+=min(yspd,15);
//spin the player
draw_angle += rot_spd;
rot_spd *=0.99;