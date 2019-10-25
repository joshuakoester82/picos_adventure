//check distance to bombs
//grab id of nearest bomb
var obj = obj_player;
var nearestbomb = instance_nearest(obj.x,obj.y,obj_bomb);

//show arrow
if nearestbomb != noone{
//only show if player is close enough to bomb
	var dist = point_distance(obj.x,obj.y,nearestbomb.x,nearestbomb.y);
	//place arrow on current bomb
	x = nearestbomb.x;
	y = nearestbomb.y;
	// fade arrow if too far away
	if dist > 150 {
		trans -=0.05;	
	}
	if dist < 150 && nearestbomb.bomb_timer < 50{
		trans +=0.05;
		var arrowangle = point_direction(x,y+50,obj.x,obj.y);
		image_angle = arrowangle;
		depth = obj_player.depth - 1;
		
	}
}
//hide arrow
if nearestbomb = noone{
	trans = 0;	
}

//deal with transparency
trans = clamp(trans,0,1);
image_alpha = trans;