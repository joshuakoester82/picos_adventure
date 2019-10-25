if other.sprite_index != spr_explosion_2{
if invun == 0{
	invun = 20;
	hp--;
	state = 1;
	animation_timer = 200;
	var inst = obj_tentacle_attack;
	inst.state = 5;
	inst.club_timer = 0;
	obj_bossmouth.buffer = 100;
	play_sound(choose(snd_drk_groan,snd_drk_groan2,snd_drk_groan3,snd_drk_groan4,snd_drk_leavemebe),false,1,1,3,1000);
}
}