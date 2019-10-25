if sprite_index != spr_explosion_2{
	with(other){
	var blastdir = point_direction(other.x,other.y+50,x,y);
	var blast_str = 350 - point_distance(other.x,other.y,x,y);
	var blast_str = max(0,blast_str);
	addxspd = lengthdir_x(blast_str*0.1,blastdir);
	yspd = lengthdir_y(blast_str*0.1,blastdir);
	amp = 0.3;
	time = 0;
	state = player_bounce;
	rot_spd = random_range(-30,30);
	}
}