
play_sound(snd_hurt,false,1,2,1,100);


if other.invun = 0 {
with(other){
	HP-=1;
	invun = 3;
	lasthit = other.direction;
	moveforce = 4;
	}
}
with(instance_create_layer(x,y,"Player_layer",obj_fx_explosion)){
	sprite_index = spr_explosion_2;
	var scale =random_range(10,25)*0.01;
	image_xscale = scale;
	image_yscale = scale;
}
instance_destroy();