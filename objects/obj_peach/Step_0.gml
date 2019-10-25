image_angle = init_angle + cos(time/spd) * amp;
time++;
amp*=0.99;	



if keyboard_check_pressed(vk_space) && state == 1{
	amp += random(50);	
	size+=0.05;
	play_sound(snd_whack,false,snd_freq,snd_freq,1,100);
	snd_freq += 0.05;
}

image_xscale = size;
image_yscale = size;

if size > 1.2{
instance_create_layer(x,y,"Instances",obj_peachfrag);
instance_create_layer(x,y,"Instances",obj_peachfrag);
instance_create_layer(x,y,"Instances",obj_peachfrag);
instance_create_layer(x,y,"Instances",obj_peachfrag);
instance_create_layer(x,y,"Instances",obj_titleplayer);
Camera.target = obj_titleplayer;
Camera.target_zoom = 1;
play_sound(snd_pop,false,0.8,1.5,1,100);
play_sound(music_spoons,true,1,1,1,1000);
instance_destroy();
}


show_debug_message(size);