//
target = obj_boss;
x = target.x;
y = target.y;
image_xscale = target.image_xscale;
image_yscale = target.image_yscale;
if buffer == 0 {
	sprite_index = spr_bossmouth_closed;	
}
if buffer > 0 {
	sprite_index = spr_bossmouth_open;
	buffer --;
}