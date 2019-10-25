//set text
if diag_index <= array_length_1d(dialogue)-1{
	ttext = dialogue[diag_index];
}
else{
	diag_index = 0;
	flag_visible = false;
}
//advance text
if ctext == ttext && flag_visible == true{
	if keyboard_check_pressed(vk_anykey){
	ctext = "";
	diag_index++;
	}
}
//draw text
draw_set_alpha(dialogue_alpha);
draw_set_font(fnt_1);
draw_set_color(c_white);
var inst = obj_chatbox;
draw_sprite_ext(inst.sprite_index,inst.image_index,inst.x,inst.y,inst.scale,inst.scale,inst.image_angle,c_white,inst.image_alpha);
draw_text_ext(obj_chatbox.x-225,obj_chatbox.y-50,ctext,30,450);

//show and hide box
if flag_visible == true{
dialogue_alpha = min(1,dialogue_alpha+0.03);	
}
if flag_visible == false{
dialogue_alpha = max(0,dialogue_alpha-0.03);	
}

//display text
if flag_visible == true && dialogue_alpha == 1{
	texttimer++;
	if texttimer == 2{
		if string_length(ctext) != string_length(ttext){
		var strlen = string_length(ctext);
		ctext = string_copy(ttext,1,strlen+1);
		play_sound(snd_blip,false,0.5,1,1,100);
		}
		texttimer = 0;
	}
}





//reset settings
draw_set_color(c_white);
draw_set_alpha(1);


