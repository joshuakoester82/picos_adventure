/// @description Insert description here
// You can write your code in this editor
with(obj_thornstalk)
{
	if group_id = other.group_id
	{
	tsize = choose(0.8,0.6,0.9);
	play_sound(choose(snd_explode,snd_explode2,snd_explode3),false,0.5,1,1,100);
	spawn_fx(obj_smoke,0,0,5,10,10,32,0.1,1,"Player_layer",1);
	}
}
instance_destroy();