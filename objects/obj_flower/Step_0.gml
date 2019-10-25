
size += (tSize - size) *0.05;
image_xscale = size;
image_yscale = abs(size);
image_angle = cos(time/10) * amp;
amp *= 0.98;
time +=1;
// destroy the flower if it's floating in air.
if !place_meeting(x,y+4,obj_block){
	instance_destroy();	
}




