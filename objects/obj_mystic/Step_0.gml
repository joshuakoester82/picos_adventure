if state == "normal"{
#region state normal
//gravity
yspd += 0.1;
//collisions
if place_meeting(x+xspd,y,obj_block){
	while !place_meeting(x+sign(xspd),y,obj_block){
		x+=sign(xspd);	
	}
	//bounce on collision
	xspd*=-1;
}
if place_meeting(x,y+yspd,obj_block){
	while !place_meeting(x,y+sign(yspd),obj_block){
		y+=sign(yspd);	
	}
	yspd = 0;
}

//update positions
x+=xspd;
y+=yspd;

//AI behaviors
var _dist_to_player = distance_to_object(obj_player);
if _dist_to_player < 300 {
	state = "targeting";
	play_sound(snd_alert,false,0.5,1.2,1,100);
	instance_create_depth(x,y-100,depth+1,obj_exclamation);
	xspd = choose(-0.5,0.5);	
	y-=5;
}
#endregion
}
if state == "targeting"{
	#region targeting
//gravity
yspd += 0.1;
//collisions
if place_meeting(x+xspd,y,obj_block){
	while !place_meeting(x+sign(xspd),y,obj_block){
		x+=sign(xspd);	
	}
	//bounce on collision
	xspd*=-1;
}
if place_meeting(x,y+yspd,obj_block){
	while !place_meeting(x,y+sign(yspd),obj_block){
		y+=sign(yspd);	
	}
	yspd = 0;
}

//update positions
x+=xspd;
y+=yspd;
//Pace randomly
timer_pace = irandom(200);
if timer_pace == 1{
	xspd = choose(-1.5,1.5);	
}
//throw the brush
timer_throw = irandom(200);
if timer_throw == 1{
	sprite_index = spr_mystic_throw;
	timer_throw = 0;
	image_index = 0;
	state = "throw";
}
	#endregion
}
if state == "throw"{
#region Throw
timer_throw++;
if timer_throw == 100{
	image_index = 1;
	play_sound(choose(snd_mystic_hya1,snd_mystic_hya2,snd_mystic_hya3),false,1,1.2,5,100);
	play_sound(snd_spin,true,1,1,20,100);	
	with(instance_create_depth(x,y,depth-1000,obj_paintbrush)){
		var _targetpoint = point_direction(x,y,obj_player.x,obj_player.y);
		xspd = lengthdir_x(20,_targetpoint);
		yspd = lengthdir_y(20,_targetpoint);
		rot_spd = xspd;
		image_xscale = other.orig_scale;
		image_yscale = other.orig_scale;
	}

}
if timer_throw == 300{
	sprite_index = spr_mystic_throwidle;	
}
#endregion	
}
if state == "running"{
#region running
timer_yell++;
if timer_yell = 100{
	play_sound(choose(snd_mystic_hya1,snd_mystic_hya2,snd_mystic_hya3),false,0.8,1.2,1,100);
	timer_yell = 0;
}
//gravity
yspd += 0.1;
//collisions
if place_meeting(x+xspd,y,obj_block){
	while !place_meeting(x+sign(xspd),y,obj_block){
		x+=sign(xspd);	
	}
	//bounce on collision
	xspd*=-1;
}
if place_meeting(x,y+yspd,obj_block){
	while !place_meeting(x,y+sign(yspd),obj_block){
		y+=sign(yspd);	
	}
	yspd = 0;
}

//update positions
x+=xspd;
y+=yspd;
//stop running
timer_run++;
if timer_run == 200{
	state = "targeting";	
	xspd = choose(-2,2);
	timer_run = 0;
}
#endregion
}

#region hurt
if HP = 0{
	var _hitxspd = 0;
	if x > obj_player.x{
		_hitxspd = 1;	
	}
	if x < obj_player.x{
		_hitxspd = -1;	
	}
	state = "hurt";
	yspd = -6;
	xspd = 2* _hitxspd;
	HP--;
	Lives--;
	sprite_index = spr_mystic_hurt;
	Camera.shake = 20;
	play_sound(choose(snd_mystic_ow,snd_mystic_ow2),false,0.8,1.2,2,100);
}

if state == "hurt"{
	//gravity
	yspd += 0.1;
	//collisions
	if place_meeting(x+xspd,y,obj_block){
		while !place_meeting(x+sign(xspd),y,obj_block){
			x+=sign(xspd);	
		}
		//bounce on collision
		xspd=0;
	}
	if place_meeting(x,y+yspd,obj_block){
		while !place_meeting(x,y+sign(yspd),obj_block){
			y+=sign(yspd);	
		}
		yspd = 0;
		xspd = 0;
		if sprite_index != spr_mystic_down{
			play_sound(choose(snd_thud1,snd_thud2,snd_thud3),false,0.8,1.2,1,100);	
		}
		sprite_index = spr_mystic_down;
		
	}

	//update positions
	x+=xspd;
	y+=yspd;
	HP--;
	//get back up and change state or Die when needed
	if HP = -300{
		if Lives <= 0{
			spawn_fx(obj_smoke,0,0,5,10,64,64,0.5,1,"Player_layer",1);
			play_sound(choose(snd_fart1,snd_fart2,snd_fart3),false,0.8,1.2,1,100);
			instance_destroy();
		}
		HP = fullhp;
		state = "running";	
		xspd = choose(-10,10);
	}
	
	
}
#endregion

show_debug_message(Lives);
