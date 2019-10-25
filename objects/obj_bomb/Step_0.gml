/// @description Insert description here
// You can write your code in this editor
// apply gravity
yspd += 0.1;
//collisions with bounce
if place_meeting(x+xspd,y,obj_block){
	while !place_meeting(x+sign(xspd),y,obj_block){
		x+=sign(xspd);
	}
	xspd *= -0.5;
	rot_spd = random_range(-10,10);
	play_sound(choose(snd_thud1,snd_thud2,snd_thud3),false,0.8,2,1,100);
}
if place_meeting(x,y+yspd,obj_block){
	if yspd > 1{
	play_sound(choose(snd_thud1,snd_thud2,snd_thud3),false,0.8,2,1,100);
		}
	while !place_meeting(x,y+sign(yspd),obj_block){
		y+=sign(yspd);	
	}
	yspd *= -0.5;
	xspd *= 0.5;
	rot_spd *= 0.98
}



//calculate movement & move

y += yspd;
x += xspd;
rot_spd *= 0.98;
rot_angle += rot_spd;


//explode
if place_meeting(x,y+1,obj_block) {
	bomb_timer-=1;
	rot_spd *= 0.95;
}
if (bomb_timer < 0){
play_sound(choose(snd_explode,snd_explode2,snd_explode3),false,0.8,1.5,1,100);
	Camera.shake = random_range(5,50);
	with(instance_create_layer(x,y,"Player_layer",obj_fx_explosion)){
		sprite_index = spr_explosion_1;
		var inst = instance_place(x,y+1,obj_room_floor);
		if inst != noone{
		inst.HP += 10;
		inst.Beauty += 10;
		if inst.flag_beauty == false{
			with(obj_eye){
			amp = 0.8;
			time = 30;
			}
			inst.flasher = 3;
			play_sound(snd_hurt,false,1,2,1,100);
			var playhurtsound = irandom(1);
			if playhurtsound = 1{
			var sound = choose(snd_drk_groan,snd_drk_groan2,snd_drk_groan3,snd_drk_groan4,snd_drk_ow,snd_drk_ow2,snd_drk_stop,snd_drk_stopit,snd_drk_stopit2);
			play_sound(sound,false,1,1,5,100);
			}
			}
		}
		
		
	}
	with(instance_create_layer(x,y,"Islands_Foreground",obj_sprout)){
		var i = 0;
		while !place_meeting(x,y+1,obj_block){
			y+=1;
			i++;
			if (i >100) break;
		}
	}
	instance_destroy();
}
