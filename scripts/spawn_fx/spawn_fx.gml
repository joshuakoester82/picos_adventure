///@arg object
///@arg x_offset
///@arg y_offset
///@arg min
///@arg max
///@arg yspread
///@arg xspread
///@arg min_size
///@arg max_size
///@arg layer
///@arg image_index

// set arguments
var object = argument0;
var xoffset = argument1;
var yoffset = argument2;
var minimum = argument3;
var maximum = argument4;
var yspread = argument5;
var xspread = argument6;
var min_size = argument7,
var max_size = argument8;
var layerid = argument9;
var imageindex = argument10;

// spawn smoke
var repeater = random_range(minimum,maximum);
repeat repeater
{
	var xo = xoffset + random_range(xspread*-1,xspread);
	var yo = yoffset + random_range(yspread*-1,10);
	with(instance_create_layer(x+xo,y+yo,layerid,object))
	{
		image_angle = random(360)
		var ran_scale = random_range(min_size,max_size);
		image_xscale = ran_scale;
		image_yscale = ran_scale;
		yspd = random_range(0,60)*0.1;
		rot_spd = random_range(-50,50)*0.1;
		image_index = imageindex;
	}
}