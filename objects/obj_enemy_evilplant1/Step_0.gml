yscaler += (tyscale - yscaler) *0.1;
xscaler += (txscale - xscaler) *0.1;
squishbuffer = max(squishbuffer-1,0);

if squishbuffer == 0{
	flag_squishstate = !flag_squishstate;
	squishbuffer = 30;
	}

if flag_squishstate == true{
	tyscale = 0.8;
	txscale = 1.2;
}
if flag_squishstate == false{
	tyscale = 1.2;
	txscale = 0.8;
}

//grow
if (on_screen(view_camera[0])){
	flag_grow = true;	
}
if flag_grow == true{
origscale = min(1.3, origscale+0.0005);
}

image_xscale = (xscaler*origscale)*dirmod;
image_yscale = yscaler*origscale;


//destroy
if origscale < 0.1{
	spawn_fx(obj_smoke,0,0,5,15,15,20,0.1,1,"Enemies",1);
	play_sound(choose(snd_explode,snd_explode2,snd_explode3),false,0.5,2,1,100);
	Camera.shake = 20;
	instance_destroy();	
}

