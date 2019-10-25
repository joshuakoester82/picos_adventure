//animations
if animation_timer > 0{
	sprite_index = spr_club_hurt;
	animation_timer--;
	spawn_fx(obj_smoke,0,-sprite_height*0.5,1,5,128,128,0.2,1,"Player_layer",0);
}
else{
	sprite_index = spr_club_normal;	
}
//shaders
if invun > 0 {
	invun--;
	shader_set(shRed);
}
//normal draw process
draw_self();
shader_reset();
