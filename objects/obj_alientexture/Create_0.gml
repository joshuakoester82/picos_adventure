talpha = 0;
image_alpha = 0;
//shader init
var camid = view_camera[0];
draw_set_color(c_white);

uni_time = shader_get_uniform(shd_wave,"time");
var_time_var = 0;

uni_resolution = shader_get_uniform(shd_wave,"resolution");
var_resolution_x = camera_get_view_width(camid);
var_resolution_y = camera_get_view_height(camid);

uni_wave_amount = shader_get_uniform(shd_wave,"wave_amount");
var_wave_amount = 5; //higher = more waves

uni_wave_distortion = shader_get_uniform(shd_wave,"wave_distortion");
var_wave_distortion = 300; //higher = less distortion

uni_wave_speed = shader_get_uniform(shd_wave,"wave_speed");
var_wave_speed = 2; //higher = faster

uni_alpha = shader_get_uniform(shd_wave,"alpha");
var_alpha = image_alpha;

shader_enabled = true;
