
// fade based on mode
percent += (tpercent - percent) * spd;
percent = clamp(percent,0,1);


//draw the rectangle
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
draw_set_color(c_black);
draw_set_alpha(percent);
draw_rectangle(0,0,gui_w,gui_h,false);


//restore color and alpha
draw_set_color(c_white);
draw_set_alpha(1);

