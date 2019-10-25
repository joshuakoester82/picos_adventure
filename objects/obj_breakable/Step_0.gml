/// @description Insert description here
// You can write your code in this editor


if (flag_splode == true) splode --;
if splode = 0{
	with(obj_breakable){
	var dist = point_distance(x,y,other.x,other.y);
	if (dist < 65) flag_splode = true;
	}
	with(instance_create_layer(x,y,"Player_layer",obj_fx_explosion)){
	var scaler = random_range(0.1,0.5);
	image_xscale = scaler;
	image_yscale = scaler;
	image_angle = random(360);
	}
	Camera.shake = 50;
	play_sound(choose(snd_explode,snd_explode2,snd_explode3),false,0.5,1.5,1,100);
	instance_destroy();
}


