
if group_id = obj_room_floor.group_id
{
	var hpval = obj_room_floor.HP;
	tscale = obj_room_floor.HP * 0.003;
	if hpval < 50 sprite_index = spr_tree_dead;
	if hpval == 100 && sprite_index != spr_tree_mid{
		sprite_index = spr_tree_mid;
		play_sound(choose(snd_explode,snd_explode2,snd_explode3),false,0.5,1.5,1,100);
		spawn_fx(obj_leaf,0,0,10,50,sprite_height*0.5,sprite_width*0.5,0.5,1,"Player_layer",1);
	}
	if (image_xscale == 0.7){
		if sprite_index != spr_tree_alive {
			sprite_index = spr_tree_alive;
			play_sound(choose(snd_explode,snd_explode2,snd_explode3),false,0.5,1.5,1,100);
			spawn_fx(obj_leaf,0,0,10,50,sprite_height*0.5,sprite_width*0.5,0.5,1,"Player_layer",1);
			//send signal to thorns
			with(obj_thorns){
				if (group_id == other.group_id) flag_down = true;
			}
			with(obj_thornstalk)
			{
				if (group_id == other.group_id) tsize = 0;	
			}
		}
		
	}
	
}


//scale the tree smoothly
var xscale = image_xscale;
xscale += (tscale - xscale) * 0.1;
xscale = min(xscale,0.7);
image_xscale = xscale;
image_yscale = xscale;

depth = obj_player.depth +1;

//camera signals
if (instance_exists(obj_player)) var dist = abs(obj_player.x - x);
if dist > 300 && signal == 0{
Camera.target_zoom = 1;
signal = 1;
}
if (dist < 300){
	if (signal == 1) signal =0;
	if (sprite_index = spr_tree_mid) Camera.target_zoom = 1.5;
	
}



