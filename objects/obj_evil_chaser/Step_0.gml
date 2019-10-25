//follow player poorly
inst = obj_player;
if inst.x > x{
	xspd += accel;
}
if inst.x < x{
	xspd -= accel;
}
if inst.y > y{
	yspd += accel;
}
if inst.y < y{
	yspd -= accel;	
}

//open mouth when close. Close mouth when far
var dist = point_distance(x,y,inst.x,inst.y);
if dist > 200{
	sprite_index = spr_chaser_closed;	
}
else{
	sprite_index = spr_chaser_open;	
}
//counters
invun--;
invun = max(0,invun);
//destroy
if hp <= 0{
	play_sound(snd_explode,false,0.5,1.2,1,100);
	Camera.shake = 20;
	spawn_fx(obj_smoke,0,0,5,10,sprite_height * scaler, sprite_width * scaler,0.1,1,"Player_layer",0);
	instance_destroy();
}
//move
x+=xspd;
y+=yspd;

