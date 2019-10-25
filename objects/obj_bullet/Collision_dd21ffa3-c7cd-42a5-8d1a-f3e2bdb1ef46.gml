if other.state != "hurt" && other.state != "running"{
	if other.state = "normal"{
		other.state = "targeting";
		play_sound(snd_alert,false,0.5,1.2,1,100);
		instance_create_depth(x,y-100,depth+1,obj_exclamation);
		other.xspd = choose(-0.5,0.5);	
		other.y-=5;
	}
	play_sound(snd_hurt,false,1,2,1,100);
	if other.invun = 0 {
	with(other){
		HP-=1;
		invun = 3;
		}
	}
	with(instance_create_layer(x,y,"Player_layer",obj_fx_explosion)){
		sprite_index = spr_explosion_2;
		var scale =random_range(10,25)*0.01;
		image_xscale = scale;
		image_yscale = scale;
	}
	instance_destroy();
}

