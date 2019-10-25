// --- Shrink or extend based on state flag
if flag_on == false{
	tx = 0;
	ty = 0;
	amp = 0;
	time = 0;
}

if flag_on == true{
	tx = orig_xscale;
	ty = orig_yscale;
	amp = rnd_amp;
}
// smooth resize
xscaler += (tx - xscaler) * 0.05;
yscaler += (ty - yscaler) * 0.05;

// squish
time ++;
var squish = sin(time/spd) * amp;
image_xscale = (xscaler + squish) * xdir;
image_yscale = yscaler - squish;

// match state of corresponding island
with (obj_room_floor){
	if group_id == other.ID{
	other.flag_on = !flag_beauty;	
	}
}

