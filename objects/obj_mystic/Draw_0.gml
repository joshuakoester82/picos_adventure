var playerdir = 0;
if state == "normal"{
#region normal
//draw extended sprite
var scale = orig_scale;
if xspd !=0{
	var scale = orig_scale * sign(xspd);
}
var brushoffset = sin(time/15)*amp;
time++;
sprite_index = spr_mystic_walk;
draw_sprite_ext(sprite_index,image_index,x,y,scale,orig_scale,image_angle,c_white,1);
draw_sprite_ext(spr_paintbrush_held,0,x,y+brushoffset,scale,orig_scale,image_angle,c_white,1);
#endregion
}
if state == "throw"{
	#region throw
sprite_index = spr_mystic_throw;
var playerdir = 0;
if x > obj_player.x {
	playerdir = -1;
}
if x < obj_player.x {
	playerdir = 1;	
}
var scale = orig_scale * playerdir;
draw_sprite_ext(sprite_index,image_index,x,y,scale,orig_scale,image_angle,c_white,1);
	#endregion
}
if state == "targeting"{
	#region targeting
//set sprite index
sprite_index = spr_mystic_shuffle;
//draw extended sprite
var brushoffset = sin(time/15)*amp;
time++;
var playerdir = 0;
if x > obj_player.x {
	playerdir = -1;
}
if x < obj_player.x {
	playerdir = 1;	
}
var scale = orig_scale * playerdir;
draw_sprite_ext(sprite_index,image_index,x,y,scale,orig_scale,image_angle,c_white,1);
draw_sprite_ext(spr_paintbrush_held,0,x,y+brushoffset,scale,orig_scale,image_angle,c_white,1);
	#endregion
}
if state == "hurt"{
#region hurt
var playerdir = 0;
if x > obj_player.x {
	playerdir = -1;
}
if x < obj_player.x {
	playerdir = 1;	
}
scale = orig_scale * playerdir;
draw_sprite_ext(sprite_index,image_index,x,y,scale,orig_scale,image_angle,c_white,1);
#endregion	
}
if state == "running"{
	#region running
	sprite_index = spr_mystic_run;
	var scale = orig_scale * sign(xspd);
	draw_sprite_ext(sprite_index,image_index,x,y,scale,orig_scale,image_angle,c_white,1);
	
	#endregion
}








//shader
if invun > 0{
	if xspd != 0{
	var scale = orig_scale * sign(xspd);
	image_xscale = scale;
	}
	if playerdir != 0{
	var scale = orig_scale * playerdir;
	image_xscale = scale;	
	}
	shader_set(shWhite);
	draw_self();
	shader_reset();
	invun--;
}
