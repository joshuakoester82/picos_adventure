//Destroy the sprout if it's inside of a block, or floating in air.
if place_meeting(x,y-2,obj_block) instance_destroy();
if !place_meeting(x,y+4,obj_block) instance_destroy();

//grow
size += (tsize - size) *0.1;
image_xscale = size * rnd_dir;
image_yscale = size;