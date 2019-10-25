

play_sound(choose(snd_thud1,snd_thud2,snd_thud3),false,1,3,0.5,100);


with(instance_create_layer(x,y,"Player_layer",obj_fx_explosion)){
	sprite_index = spr_explosion_2;
	var scale =random_range(10,25)*0.01;
	image_xscale = scale;
	image_yscale = scale;
}
var flowercount = 0;
var flowers = 0;
with(obj_flower){
	if point_distance(x,y,other.x,other.y) < 50{
	flowercount++;	
	}
}
if (obj_mouth.flowercooldown > 2) && flowercount < 5{
	if image_angle > 180 {
	with(instance_create_layer(x,y,"Player_layer",obj_flower)){
	sprite_index = choose(spr_flower,spr_flower2,spr_flower3,spr_flower4);
	depth = obj_player.depth -1;
	var i = 0;
	while !place_meeting(x,y+1,obj_block){
		y+=1;	
		i+=1;
		if (i>100) {
			instance_destroy();
			break;
			}
	if (place_meeting(x,y,obj_block)) instance_destroy();
	obj_mouth.flowercooldown = 0;
	}
}
}
}
instance_destroy();

