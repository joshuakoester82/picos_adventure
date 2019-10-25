// smooth scale
scaler += (tscale - scaler) *0.1;
//clamp scale when active
if flag_active == true {
image_xscale = max(0.2,image_xscale);
image_yscale = max(0.2,image_yscale);
}
// activate the cannon when level is fully beautiful.
// pause player. Kill enemies. Pan to Cannon. Grow out of ground. Pan back. Re-activate player.
var evilislands = 0;
with (obj_room_floor){
	if flag_beauty == false{
		evilislands ++;
		}
}
if obj_hudvine.vinelength >= 1 && flag_active == false && evilislands == 0{
flag_active = true;	
obj_player.state = player_null;
Camera.target_zoom = 2;
}
//end of level cinematic stuff
if flag_active == true{
	endtimer++;
	if endtimer = 100{
	Camera.target = obj_cannonhead;
	}
	if endtimer = 160{
	tscale = 1;
	time = 0;
	amp = 0.5;
	play_sound(snd_explode3,false,0.5,1,1,100);
	}
	if endtimer = 250{
	audio_stop_all();
	play_sound(music_peaceful,true,1,1,1,100000);
	Camera.target = obj_player;
	}
	if endtimer = 270{
	obj_player.state = player_main;
	}
}
//squishy
amp*=0.96;
time++;
var squishscaler = sin(time/squishmod)*amp;
image_xscale = (orig_scale * scaler) + squishscaler;
image_yscale = (orig_scale * scaler) - squishscaler;
//depth
depth = obj_player.depth + 1;