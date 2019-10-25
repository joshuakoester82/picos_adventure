/// @description 
// inputs
if obj_player.state = player_main
{
	var shoot_input = mouse_check_button(mb_left);
	var bomb_input = mouse_check_button_pressed(mb_right);
	// Angle gun and change xscale
	var gun = obj_mouth;
	image_angle = point_direction(x,y,mouse_x,mouse_y);
	if (image_angle > 90) && (image_angle < 270) gun.image_yscale = gun.orig_image_yscale * -1;
	else gun.image_yscale = gun.orig_image_yscale * 1;

	//fire gun
	image_alpha = 0;
	if (shoot_input = true) image_alpha = 1;;
	var bulletoffset = 15;
	shoot_cooldown = max(shoot_cooldown-1,0);
	recoil = max(0,recoil-1);
	if shoot_input = true && shoot_cooldown = 0{
		if (Camera.shake < 10) Camera.shake = 2;
		shoot_cooldown = 5;
		recoil = 5;
		play_sound(snd_gunshot,false,0.5,2,1,100);
		with(instance_create_layer(x,y,"Player_layer",obj_bullet)){
			x += lengthdir_x(bulletoffset,gun.image_angle);
			y += lengthdir_y(bulletoffset,gun.image_angle);
			speed = 25;
			direction = other.image_angle+random_range(-5,5);
			image_angle = direction;;
			image_xscale = 0.3;
			image_yscale = 0.3;
			depth = gun.depth - 1;
			with(instance_create_layer(x,y,"Player_layer",obj_muzzleflash)){
				x += lengthdir_x(bulletoffset,gun.image_angle);
				y += lengthdir_y(bulletoffset,gun.image_angle);
				image_angle = other.direction;
				depth = other.depth - 1;
			}
		}	
	}
	// shoot bomb
	if mouse_check_button(mb_right) = true image_alpha = 1;
	if (bomb_input) == true && shoot_cooldown == 0{
		play_sound(choose(snd_bleh1,snd_bleh2,snd_bleh3,snd_bleh4),false,0.8,1.3,1,100);
		image_alpha = 1;
		shoot_cooldown = 50;
		recoil = 10;
		with(instance_create_layer(x,y,"Player_layer",obj_bomb)){
			depth = gun.depth -1;
			var theangle = degtorad(other.image_angle);
			xspd = cos(theangle)*5;
			yspd = sin(theangle)*-5;
			image_xscale = 0.5;
			image_yscale = 0.5;
			rot_spd = random_range(-50,50);
			if place_meeting(x,y,obj_block){
				while place_meeting(x,y,obj_block){
				x+=sign(-xspd);
				}
			}
		
		}
	}
	//recoil
	x = x - lengthdir_x(recoil,image_angle);
	y = y - lengthdir_y(recoil,image_angle);
	//flower cooldown
	flowercooldown +=1;
}
else image_alpha = 0;


