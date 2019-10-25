if state == "open"{
	//---------------------do all the stuff in here
	if flash_buffer == 0{
		flash_buffer = 5;
		HP--;
		play_sound(snd_hurt,false,0.5,1,0.2,1000);
		var rnd = irandom(50);
		if rnd == 0{
			play_sound(choose(snd_drk_groan,snd_drk_groan2,snd_drk_groan3,snd_drk_groan4,snd_drk_ow,snd_drk_ow2,snd_drk_stop,snd_drk_leavemebe,snd_drk_nostopit,snd_drk_stopit,snd_drk_stopit2),false,1,1,1,1000);
		}
		with other{
			instance_destroy();	
		}
	}
	if flash_buffer > 0 {
		play_sound(snd_whack,false,0.5,1,1,1000);	
	}
	//------------------------- because if the eye is closed we don't want to hurt it, derpaderp
}