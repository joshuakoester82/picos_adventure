//flash
if flash_buffer > 0{
	flash_buffer --;
	shader_set(shRed);
	draw_self();
	shader_reset();
}
if flash_buffer == 0{
	draw_self();
}
