
//collide with ground
if place_meeting(x,y+1,obj_block){
	if state == 0{
		state = 1;
		Camera.shake = 50;
		play_sound(snd_explode,false,0.5,1.2,1,1000);
		spawn_fx(obj_smoke,0,-sprite_height,5,10,32,128,0.2,1,"Player_layer",0);
		obj_tentacle_attack.state = 4;
		obj_tentacle_attack.club_timer = 0;
		with(obj_player){
			if place_meeting(x,y+1,obj_block){
				  play_sound(choose(snd_thud1,snd_thud2,snd_thud3),false,0.5,1.5,2,100);
				  play_sound(snd_hurt,false,0.5,1.5,1,100);
				  audio_stop_sound(snd_walking);
				  hitfrom = random(360);
				  xspd = lengthdir_x(3,hitfrom);
				  yspd = -3;
				  sprite_index = spr_player_hit;
				  invun_buffer = 150;
				  image_xscale = orig_image_xscale * -sign(xspd);
				  flash_counter = 20;
				  Camera.tilt = random_range(10,50);
				  Camera.shake = random_range(10,50);
				  state = player_knockback;
			}
		}
	}
}
//position at end of tentacle
x = obj_tentacle_attack.x;
y = obj_tentacle_attack.y + obj_tentacle_attack.sprite_height;
image_yscale = -1;
depth = 350;
//retract
if hp = 0 {
	obj_boss.pause_timer++;
	if obj_boss.pause_timer == 100{
		hp = 3;
		with(obj_tentacle_attack){
			state = 0;
			club_timer = 0;
		}
		with(obj_tentacle_up){
			tscale = 0;	
		}
		with(obj_boss){
			state = "on";
			spike_state = 1;
			
		}
		with(obj_bosseye){
			HP = round(100*image_xscale);
			state = "open";
			}
	}
}


	

