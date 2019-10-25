///@arg sound
///@arg loop
///@arg min_freq
///@arg max_freq
///@arg gain
///@arg priority


// set arguments
var snd_pool = argument0;
var loop = argument1;
var min_freq = argument2;
var max_freq = argument3;
var gain = argument4;
var priority = argument5;

//play sound
var pitch = random_range(min_freq,max_freq);
audio_play_sound(snd_pool,priority,loop);
audio_sound_pitch(snd_pool,pitch);
audio_sound_gain(snd_pool,gain,0);