//spawn fx
if (point_distance(x+sprite_width*0.5,y,obj_player.x,obj_player.y) < 2000) && (flag_cursed == true){
	fx_counter++;
	if fx_counter == 10{
	spawn_fx(obj_smoke,0,-sprite_height*0.7,3,5,0,sprite_width*0.5,0.1,0.5,"Islands_background",0);
	fx_counter = 0;
	}
	if fx_counter = 5{
	instance_create_layer(x+random_range(sprite_width*-0.5,sprite_width*0.5),y+random(sprite_height),"Blocks",obj_blip);	
	}
}

//squish effect
var squish = sin(time/5)*amp;
time++;
amp *= 0.96;
image_xscale = orig_xscale + squish;
image_yscale = orig_yscale - squish;