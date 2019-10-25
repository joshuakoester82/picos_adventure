var _camera_id = view_camera[0];
//zoom
zoom_level += (target_zoom - zoom_level) * zoom_spd
target_zoom = clamp(target_zoom,min_zoom,max_zoom);
zoom_level = clamp(zoom_level,min_zoom,max_zoom);
camera_set_view_size(_camera_id,base_width*zoom_level,base_height*zoom_level);
//follow target
target_x = target.x;
target_y = target.y-y_offset*zoom_level;
x += ((target_x - x) *move_spd)+random_range(shake*-1,shake);
y += ((target_y - y) *move_spd)+random_range(shake*-1,shake);
var _camera_height = camera_get_view_height(_camera_id);
var _camera_width = camera_get_view_width(_camera_id);
camera_set_view_pos(view_camera[0], x -_camera_width*0.5, y-_camera_height*0.5);
shake *= shake_decay;
//clamp camera
x = clamp(x,_camera_width*0.5,room_width-_camera_width*0.5);
y = clamp(y,_camera_height*0.5,room_height-_camera_height*0.5);
//tilt camera
camera_set_view_angle(_camera_id,random_range(-tilt,tilt));
tilt *= 0.90;

// Paralax
var halfx = x + _camera_width * 0.5;
var halfy = y = _camera_height * 0.5;
var clouds = layer_get_id("Clouds");

if (layer_exists(clouds)){
layer_x(clouds,halfx/1.5);
//layer_y(clouds,_camera_height/5);
}
var mountains = layer_get_id("Mountains");
if (layer_exists(mountains))
{
layer_x(mountains,halfx/2);
//layer_y(mountains,_camera_height/3);
}
var hills = layer_get_id("Hills");
if (layer_exists(hills)){
layer_x(hills,halfx/3);	
}
var trees = layer_get_id("Trees");
if (layer_exists(trees))
{
layer_x(trees,halfx/4);
//layer_y(trees,_camera_height/2);
}