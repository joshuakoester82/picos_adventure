// set the target xscale
// current beauty / target beauty
// set current beauty
var cur_beauty = 0;
with (obj_flower){
	cur_beauty++;
}
with (obj_sprout){
	cur_beauty++;	
}
// set target beauty
var target_beauty = 0;
with (obj_baseblock){
	target_beauty += sprite_width/other.beautymod;
}
with (obj_room_floor){
	target_beauty += sprite_width/other.beautymod;
}

// set tscale
vinelength = cur_beauty/target_beauty;
vinelength = max(0,vinelength);
vinelength = min(1,vinelength);
tscale = orig_xscale * vinelength;
tscale = min(tscale,1);
// smooth scale
image_xscale += (tscale - image_xscale ) *0.1;


//debug




