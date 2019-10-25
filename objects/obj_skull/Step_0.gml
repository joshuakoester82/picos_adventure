/// @description Insert description here
// You can write your code in this editor
if place_meeting(x+xspd,y,obj_block)
{
	while !place_meeting(x+sign(xspd),y,obj_block)
	{
		x+=sign(xspd);	
	}
	xspd *= -0.5;
	rot_spd = random_range(-10,10);
}

if place_meeting(x,y+yspd,obj_block)
{
	while !place_meeting(x,y+sign(yspd),obj_block)
	{
		y+=sign(yspd);	
	}
	yspd *= -0.5;
}

if place_meeting(x,y+1,obj_block)
{
rot_spd *= 0.99;
xspd *= 0.99;
}


x += xspd;
y += yspd;
yspd += grav;