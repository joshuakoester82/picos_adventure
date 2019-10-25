if other.image_alpha == 1{
	play_sound(snd_metalding,false,0.5,1.5,1,1000);
	with(instance_create_layer(x,y,"Player_layer",obj_fx_explosion)){
	sprite_index = spr_explosion_2;
	var scale =random_range(10,25)*0.01;
	image_xscale = scale;
	image_yscale = scale;
}
	instance_destroy();
}