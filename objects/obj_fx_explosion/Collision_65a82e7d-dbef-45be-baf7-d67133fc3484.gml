if (sprite_index != spr_explosion_2) && (sprite_index != spr_explosion3){
if other.invun = 0 {
with(other){
	var explosiondir = point_direction(other.x,other.y,x,y);
	HP = 0;
	invun = 3;
	lasthit = explosiondir;
	moveforce = 6;
	}
}
}