if invun > 0 {
	shader_set(shWhite);
	draw_self();
	shader_reset();
}
else{
	draw_self();	
}