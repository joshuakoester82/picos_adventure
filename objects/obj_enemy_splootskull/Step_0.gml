// physics-----------------------------------------------------------------------
yspd += grav;
//collisions
if place_meeting(x+xspd,y,obj_block){
	while !place_meeting(x+sign(xspd),y,obj_block){
	x+=sign(xspd);	
	}
	xspd = -xspd;
}
if place_meeting(x,y+yspd,obj_block){
	while !place_meeting(x,y+sign(yspd),obj_block){
	y +=sign(yspd);	
	}
	yspd = 0;
}
// kill monster-----------------------------------------------------------------
if HP < 1 {
repeat irandom(5)+1{
	instance_create_layer(x,y-50,"Enemies",obj_sploot);
}
spawn_fx(obj_smoke,0,0,5,15,15,sprite_get_width(sprite_index)*0.5,0.1,1,"Enemies",1);
play_sound(choose(snd_fart1,snd_fart2,snd_fart3),false,0.5,2,1,100);
instance_destroy();
}
// animate-----------------------------------------------------------------------
squishbuffer = max(squishbuffer-1,0);
xscaler += (tx - xscaler) * 0.1;
yscaler += (ty - yscaler) * 0.1;
if squishbuffer == 0{
	if flag_squishstate == false{
		flag_squishstate = true;
		squishbuffer = 15;	
	}
	else{
		flag_squishstate = false;
		squishbuffer = 15;
	}
}
if flag_squishstate == false{
	tx = 0.5;
	ty = 1.5;
}
if flag_squishstate == true{
	tx = 1.5;
	ty = 0.5;
}

//move object---------------------------------------------------------------------
x += xspd;
y += yspd;