//state 0 
//away state - move back offscreen smoothly
if state == 0 {
	//move smoothly
	y+= (ty - y ) * spd;
	image_yscale+= (1 - image_yscale) *0.05;
	ty = start_y;	
}
//state 1 - move onscreen
if state == 1 {

	//move smoothly
	y+= (ty - y ) * spd;
	ty = start_y+700;	
	//advance
	club_timer++;
	if club_timer == 200{
		state = 2;	
		club_timer = 0;
	}
}
//state 2 - sin movement
if state == 2 {

	//sin movement up and down and left and right
	time++;
	y = ty + (sin(time/30) * 100);
	x = center_x + sin(time/60) * 500;
	//strike ground state
	var rnd = irandom(500);
	if rnd == 1{
		obj_tentacle_club.state = 0;
		state = 3;	
		club_timer = 0;
	}
}
// state 3 - strike state
if state == 3 {
	club_timer++;
	if club_timer > 150{
	image_yscale += 0.05;
	
	//collision code in the club object
	}
	
}
//state 4 - wait a bit then go back up
if state == 4{
	club_timer++;
	if club_timer = 150{
		club_timer = 0;
		state = 5;
	}
}

//state 5 - withdraw state
if state == 5{
	club_timer++;
	image_yscale+= (1 - image_yscale) *0.05;
	if club_timer == 150{
		state = 2;
	}
	
}







