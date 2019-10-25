draw_angle = 0;
addxspd = 0;
yspd = 0;
sprite_index = spr_player_down;

if keyboard_check_pressed(vk_anykey){
	yspd = -3;
	play_sound(snd_jump,false,0.5,1,1,100);
	state = player_main;	
}

while !place_meeting(x,y+1,obj_block){
y+=1;	
}
if place_meeting(x,y,obj_block){
	while place_meeting(x,y,obj_block){
	y-=1;	
	}
}
