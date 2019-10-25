if x > tx {
xspd-= spd;	
}
if x < tx{
xspd +=spd;	
}
if y >ty{
yspd -= spd;	
}
if y < ty{
yspd += spd;	
}
x+= xspd;
y+= yspd;

if xspd != 0{
image_xscale = sign(xspd);
}

//spawn glitter
glitterbuffer++;
if glitterbuffer == 10{
instance_create_depth(x,y,depth-1,obj_glitter);
glitterbuffer = 0;
}

// get grabbed
if instance_place(x,y,obj_player) && flag_grabbed == false{
flag_grabbed = true;
tscale = 0
play_sound(snd_pickup,false,0.8,1.5,4,100);
}
//scale
scaler += (tscale - scaler) *0.1;
image_xscale = scaler * sign(xspd);
image_yscale = scaler;
// destroy and add to total
if scaler < 0.01 {
	obj_player.points ++;
	instance_destroy();	
}