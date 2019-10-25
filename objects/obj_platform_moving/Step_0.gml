// move if activated
if flag_moving == true{
	if place_meeting(x+xspd,y,obj_block){
		while !place_meeting(x+sign(xspd),y,obj_block){
		x+=sign(xspd);
		}
	xspd *= -1;
	}

x+=xspd;	
}
