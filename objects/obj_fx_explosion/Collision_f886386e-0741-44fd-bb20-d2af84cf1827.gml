if (sprite_index != spr_explosion_2) && (sprite_index != spr_explosion3){
if other.invun = 0 {
with(other){
	if state != "hurt" && state != "running"{
	var explosiondir = point_direction(other.x,other.y,x,y);
	HP = 0;
	invun = 3;
	xspd = lengthdir_x(10,explosiondir);
	yspd = lengthdir_y(10,explosiondir);
	state = "hurt";
	}
	}
}
}