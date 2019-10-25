yspd += grav;


//check collisions
if place_meeting(x,y+yspd,obj_block){
	while !place_meeting(x,y+sign(yspd),obj_block){
	y+=sign(yspd);	
	}
	yspd = 0;
	sprite_index = spr_splootground;
	while !place_meeting(x,y+1,obj_block){
		y+=1;	
	}
}

if place_meeting(x+xspd,y,obj_block){
	while !place_meeting(x+sign(xspd),y,obj_block){
		x+= sign(xspd);
	}
	xspd *=-0.5;
}
if place_meeting(x,y+1,obj_block){
	sprite_index = spr_splootground;
	xspd *= 0.98;
	die_count --;
}
if die_count == 0{
	var which = choose(1,2){
		if which == 1{
			spawn_fx(obj_smoke,0,0,3,10,15,15,0.2,1,"Player_layer",1);
			play_sound(snd_fart2,false,0.5,1,1,100);
			instance_destroy();
		}
		if which == 2{
			spawn_fx(obj_smoke,0,0,3,10,15,15,0.2,1,"Player_layer",1);
			instance_create_layer(x,y,"Enemies",obj_enemy_splootskull);
			play_sound(snd_fart2,false,0.5,1,1,100);
			instance_destroy();
			}
	}
	
}



y+= yspd;
x+= xspd;