/// @description Insert description here
if obj_player.sprite_index = spr_player_spit_stand{
x = obj_player.x+20*obj_player.xdir;
y = obj_player.y-60;
depth = obj_player.depth - 1;
}
else{
x = obj_player.x+20*obj_player.xdir;
y = obj_player.y-70;
depth = obj_player.depth - 1;
}