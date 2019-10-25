//depth to topmost
depth = -1000;
//smoothscale
scaler += (tscale - scaler) *0.1;
var scale = scaler * orig_scale;
//scale up when beauty meter full
var evilcount = 0;
with (obj_room_floor){
	if flag_beauty == false{
		evilcount+=1;	
	}
}
if obj_hudvine.vinelength >= 1 && evilcount = 0{
	tscale = 1;	
}
//position at end of vine
var inst = obj_hudvine;
x = inst.guix + inst.sprite_width;
y = inst.guiy+20;


//rotate
shine_rot++;
// draw shine then star
draw_sprite_ext(spr_shine,image_index,x,y,scale,scale,shine_rot,c_white,1);
draw_sprite_ext(spr_star,image_index,x,y,scale,scale,0,c_white,1);