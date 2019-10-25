if obj_branch.time = 15{
	tx = 3000;
	play_sound(snd_whoosh,false,1,1.5,1,100);
}


x += (tx - x) *0.08;

size += (tsize - size) * 0.01;
image_xscale = size;
image_yscale = size;