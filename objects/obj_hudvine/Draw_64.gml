var _alpha = 1 - obj_transition.percent;
draw_sprite_ext(spr_beautybar,0,guix,guiy,0.15,0.15,0,c_white,_alpha-0.3);
draw_sprite_ext(sprite_index,0,guix,guiy,image_xscale,orig_yscale,0,c_white,_alpha);
draw_sprite_ext(spr_beautyext,0,guix,guiy,0.3,0.3,0,c_white,_alpha);
	//draw_set_font(fnt_2);
	//draw_set_alpha(_alpha);
	//draw_text_outline(x,y+50,"Beauty",4,c_black,8);
	//draw_text_ext(10,200,"Beauty",1,1000);
