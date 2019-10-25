x+=xspd;
y+=yspd;
xspd *= 0.97;
yspd *= 0.97;
image_angle += rot_spd;
timer++;
if timer > 200{
	x+= (obj_mystic.x - x) *0.1;
	y+= (obj_mystic.y - y) *0.1;
}
if place_meeting(x,y,obj_mystic) && timer > 200{
	obj_mystic.state = "targeting";
	obj_mystic.HP = obj_mystic.fullhp;
	audio_stop_sound(snd_spin);
	play_sound(snd_thud1,false,0.8,1.2,1,100);
	instance_destroy();
}
