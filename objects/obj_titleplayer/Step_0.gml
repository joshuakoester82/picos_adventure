
if state = 1{
image_index = 0;
yspd += 0.1;
yspd = min(yspd,10);
x+=xspd;
y+=yspd;
image_angle += rot_spd;
sprite_index = spr_playertitle2;
}
if state = 2{
image_index = 1;
image_angle = 0;
x = obj_bat.x;
y = obj_bat.y+160;
}
time++;
if time == 200{
	play_sound(snd_bleh4,false,2,2.5,1,100);
	play_sound(snd_whoosh,false,0.2,0.8,1,100);
	obj_bat.state = 2;
}
if state = 3{
image_index = 0;
yspd += 0.1;
x+=xspd;
y+=yspd;
image_angle += rot_spd;
}
	
if state != 1{
if hurtbuffer > 0{
	hurtbuffer--;	
}
if hurtanimbuffer >0{
	hurtanimbuffer--;
	sprite_index = spr_playertitle3;
}
else{
	sprite_index = spr_playertitle;	
}
}