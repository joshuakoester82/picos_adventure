/// @initialize the room

// play music
//play_sound(music_level1,true,1,1,1,1000);
// start footsteps sound
play_sound(snd_walking,true,1.8,1.8,0,1000);


if room_number == 1{
audio_stop_all();
obj_player.state = player_onface;
play_sound(music_spoons,true,1,1,1,10000);	
}

if room_number == 2{
Camera.target_zoom = 2;
audio_stop_all();
obj_player.yspd = 20;
//obj_player.addxspd = random_range(-5,5);
obj_player.rot_spd = random_range(-10,10);
obj_player.state = player_fallstart;
play_sound(music_level1,true,1,1,1,10000);
}

//set up final level

if room_number == 3{
Camera.target_zoom = 2;
audio_stop_all();
obj_player.yspd = 20;
//obj_player.addxspd = random_range(-5,5);
obj_player.rot_spd = random_range(-10,10);
obj_player.state = player_fallstart;
play_sound(snd_wind,true,1,1,1,1000);
play_sound(snd_digrumble,true,1,1,0,10000);
}