if state == 2{
depth = obj_titleplayer.depth +1;
tx = obj_titleplayer.x;
ty = obj_titleplayer.y;
x+= (tx - x) *0.05;
y+=(ty - y) *0.05;
if instance_place(x,y,obj_titleplayer){
	sprite_index = spr_bat_fly;
	obj_titleplayer.state = 2;
	state = 3;
	play_sound(snd_thud3,false,1,1,1,100);
	play_sound(snd_hurt,false,1,1,1,100);
	}
}

if state == 3{
	Camera.target_zoom = 1.5;
	x += 5;
	time++;
	ty = 3600;
	y+=(ty - y) *0.05;
}

if time == 520{
	sprite_index = spr_bat_dive;
	obj_titleplayer.state = 3;
}
if time == 600{
	obj_transition.tpercent = 1;	
}
if time == 700{
play_sound(snd_explode,false,0.5,1,1,100);	
}
if time == 800{
room_goto_next();
}