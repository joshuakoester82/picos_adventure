// follow the screen and resize based on zoom
var cam_id = view_camera[0];
x = camera_get_view_x(cam_id);
y = camera_get_view_y(cam_id);
image_xscale = Camera.zoom_level;
image_yscale = Camera.zoom_level;

//change alpha based on distance from closest corrupted island bit
if instance_exists(obj_islandparent){
	var inst = instance_nearest(obj_player.x,obj_player.y,obj_islandparent);
	if inst.flag_cursed = true{
	var greatest_dist = point_distance(obj_player.x,obj_player.y,inst.x,inst.y);
	talpha = 1 - (greatest_dist * 0.0005);
	}
	else{
	talpha = 0;	
	}
	image_alpha += (talpha - image_alpha) *0.03;
	var_alpha = image_alpha;
}
