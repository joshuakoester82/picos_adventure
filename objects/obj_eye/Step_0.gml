// position, scale, and alpha
var inst = obj_alientexture;
x = inst.x+(x_anchor * Camera.zoom_level);
y = inst.y+(y_anchor * Camera.zoom_level);
var scaler = orig_scale * Camera.zoom_level;
image_xscale = scaler;
image_yscale = scaler;
image_alpha = inst.image_alpha*0.5;

// animate
var randomizer = irandom(100);
if randomizer == 1{
sprite_index = spr_blink;
}
