// trigger the boss
obj_boss.state = "arriving";
inst = obj_room_floor;
inst.flag_beauty = false;
Camera.shake = 200;
play_sound(snd_explode,false,0.5,1,1.5,100);
var sound = choose(snd_drk_annihilate,snd_drk_consume,snd_drk_deathcomes,snd_drk_deathfollows,snd_drk_donotresist,snd_drk_iamdeath,snd_drk_ibringdeath,snd_drk_devour,snd_drk_yourdestruction);
play_sound(sound,false,1,1,1,100);
obj_islandparent.flag_cursed = true;
obj_islandparent.amp = 0.5;
obj_islandparent.time = 0;
obj_bossmouth.buffer = 100;
instance_destroy();
	