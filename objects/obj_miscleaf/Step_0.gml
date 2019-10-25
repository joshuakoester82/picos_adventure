image_angle += rotspd;
y-=yspd;

//repeat
if y < -32{
	y = room_height+32;	
}

yspd_mod +=0.05;
yspd = scaler * yspd_mod ;