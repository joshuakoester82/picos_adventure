if obj_cannonhead.flag_active == true && cannon_timer < 100{
	if obj_player.state == player_main || obj_player.state == player_bounce{
		state = player_cannon;
		obj_cannonhead.amp = 0.8;
		obj_cannonhead.time = 0;
		play_sound(choose(snd_fart1,snd_fart2,snd_fart3),false,0.5,1.2,1,100);
	}
}