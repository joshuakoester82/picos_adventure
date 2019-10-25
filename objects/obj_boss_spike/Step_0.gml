//smooth scale
image_yscale += (tscale - image_yscale) * 0.2;
// up and down
if state == "up"{
	tscale = 1;	
	state_counter++;
	if state_counter == 100{
	state = "down";
	state_counter = 0;
	}
}
if state == "down"{
	tscale = 0;	
	if obj_boss.spike_state == 1{
	state_counter++;
	if state_counter == 300{
		x = obj_boss.x + random_range(-1250,1250);
		state = "emerging";
		state_counter = 0;
		}
	}
}
if state == "emerging"{
	time++;	
	if time = 10{
		spawn_fx(obj_smoke,0,0,1,5,0,32,0.1,0.5,"Player_layer",1);
		audio_sound_gain(snd_digrumble,2,0)
		time = 0;
		state_counter++;
	}
	if state_counter == 20{
		audio_sound_gain(snd_digrumble,0,0)
		state_counter = 0;
		state = "up"
		play_sound(snd_spikeextend,false,0.5,1.2,1,1000);
	}
}

