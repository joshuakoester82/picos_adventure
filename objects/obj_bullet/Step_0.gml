var dist_to_player = point_distance(x,y,obj_player.x,obj_player.y)
if dist_to_player > 2000{
	instance_destroy();	
}