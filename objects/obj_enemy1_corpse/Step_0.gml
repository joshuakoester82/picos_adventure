// physics
yspd += grav;
//collisions

if place_meeting(x+xspd,y,obj_block){
	while !place_meeting(x+sign(xspd),y,obj_block){
		x+=sign(xspd);	
	}
	xspd = 0;
}
if place_meeting(x,y+yspd,obj_block){
	if (yspd > 1) play_sound(choose(snd_thud1,snd_thud2,snd_thud3),false,0.5,2,1,100);
	while !place_meeting(x,y+sign(yspd),obj_block){
	y +=sign(yspd);	
	}
	yspd = 0;
	xspd *= 0.95;
	sprite_index = spr_enemy1_dead;
	pop_timer --;
}

if pop_timer < 0 {
	spawn_fx(obj_smoke,0,0,5,15,15,sprite_get_width(sprite_index)*0.5,0.1,1,"Enemies",1);
	play_sound(choose(snd_fart1,snd_fart2,snd_fart3),false,0.5,2,1,100);
	instance_destroy();
}



x += xspd;
y += yspd;