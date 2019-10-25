
size += (tsize - size) *0.1;
image_xscale = size * facing;
image_yscale = size;
if facing == 0{
	while facing == 0{
		facing = irandom_range(-1,1);	
	}
}

invun = max(0,invun-1);

if hp = 0{
hp -= 1;
play_sound(choose(snd_explode,snd_explode2,snd_explode3),false,0.5,1.5,1,100);
tsize = 0;	
}