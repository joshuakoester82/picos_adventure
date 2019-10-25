//squish effect
var squish = sin(time/5)*amp;
time++;
amp *= 0.96;
image_xscale = orig_xscale + squish;
image_yscale = orig_yscale - squish;