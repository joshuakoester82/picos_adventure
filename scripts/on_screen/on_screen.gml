///@arg CameraID

//set vars
var cam_id = argument0;
var left = camera_get_view_x(cam_id)
var right = left + camera_get_view_width(cam_id);
var up = camera_get_view_y(cam_id);
var bottom = up + camera_get_view_height(cam_id);

// find out if object is on screen and return
if x > left && x < right {
	if y > up && y < bottom{
		return(true);	
	}
}