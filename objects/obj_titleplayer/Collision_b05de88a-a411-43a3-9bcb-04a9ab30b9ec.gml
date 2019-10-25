if hurtbuffer == 0{	
	hurtbuffer = 100;
	hurtanimbuffer = 20;
	play_sound(choose(snd_die1,snd_die2,snd_die3,snd_die4,snd_die5),false,1,1.5,1,100);
	play_sound(choose(snd_thud1,snd_thud2,snd_thud3),false,0.8,1,1,100);
	Camera.shake = 30;
}