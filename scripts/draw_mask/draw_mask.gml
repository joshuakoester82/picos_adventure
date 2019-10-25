///@arg outline?
///@arg alpha
var outline = argument0;
var _alpha = argument1;

draw_set_alpha(_alpha);
draw_rectangle_colour(bbox_left,bbox_top,bbox_right,bbox_bottom,c_red,c_red,c_red,c_red,outline);
