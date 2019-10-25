//snap at the player
if sprite_index == spr_snapper_idle && flag_explode == false{
	sprite_index = spr_snapper_snap;
	play_sound(snd_bite,false,0.5,1.2,1,100);
	time = 0;
	amp = 0.3;	
}

