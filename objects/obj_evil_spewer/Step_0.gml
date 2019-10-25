// active when ground it's on is active, and on screen
with(obj_room_floor){
	if flag_beauty == false && group_id == other.ID{
		other.flag_on = true;
	}
}
// if on and on screen and less than 5 chasers
var chasercount = 0;
with (obj_evil_chaser){
	chasercount++;	
}
var disttoplayer = point_distance(x,y,obj_player.x,obj_player.y);
if flag_on == true  && chasercount < 5 && disttoplayer < 2000{
	timer_appear++;
}
// resize and squishiness
time++;
amp *=0.96
var squishscaler = sin(time/10)*amp;
scaler += (tscale - scaler) *0.1;
var scale = orig_scale * scaler;
image_yscale = scale - squishscaler;
image_xscale = orig_scale + squishscaler;

//set roominst
with(obj_room_floor){
	if group_id = other.ID{
		other.roominst = id;	
	}
}
//appear
if timer_appear == 500{
	//---set random position along platform---
	//get width of floor
	var sprwidth = roominst.sprite_width;
	//get range of floor on the x axis
	var xleft = roominst.x - (sprwidth *0.5);
	var xright = xleft + sprwidth;
	//generate a random value on that line and place spewer there
	x = random_range(xleft,xright);
	//scale object up
	tscale = 1;
	play_sound(snd_explode2,false,0.5,1.5,1,100);
	
}
//spew monsters
if tscale = 1{
	timer_spew++;
}
if timer_spew == 100{
	time = 0;
	amp = 0.2;
	timer_spew = 0;
	instance_create_depth(x,y-sprite_height,depth,obj_evil_chaser);
	spawn_fx(obj_smoke,0,-sprite_height,3,10,sprite_height,sprite_width,0.1,1,"Player_layer",0);
	play_sound(choose(snd_fart1,snd_fart2,snd_fart3),false,0.5,1.2,1,100);
}
// retract the spewer
if timer_appear == 800{
	timer_appear = 0;
	tscale = 0;
}