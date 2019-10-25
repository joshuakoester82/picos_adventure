// State Machine
script_execute(state);

// collide with enemy
if invun_buffer < 1
{
	var inst;
	inst = instance_place(x, y, obj_enemy_parent) 
	if inst != noone && HP > 0
	   {    
	   play_sound(choose(snd_thud1,snd_thud2,snd_thud3),false,0.5,1.5,2,100);
	   play_sound(snd_hurt,false,0.5,1.5,1,100);
	   audio_stop_sound(snd_walking);
	   hitfrom = point_direction(inst.x,inst.y,x,y);
	   xspd = lengthdir_x(3,hitfrom);
	   yspd = -3;
	   sprite_index = spr_player_hit;
	   invun_buffer = 150;
	   image_xscale = orig_image_xscale * -sign(xspd);
	   flash_counter = 20;
	   Camera.tilt = random_range(10,50);
	   Camera.shake = random_range(10,50);
	   state = player_knockback;
	   addxspd = 0;
	   HP -= inst.damage;
	   with(instance_create_layer(-100,-100,"Player_layer",obj_leaf)){
			flag_hud = true;
			yspd = 1;
			image_xscale = 0.5;
			image_yscale = 0.5;
			
	   }
	   }
}

//buffers and counters
invun_buffer = max(0,invun_buffer-1);
flash_counter = max(0,flash_counter-1);
roomtime ++;


