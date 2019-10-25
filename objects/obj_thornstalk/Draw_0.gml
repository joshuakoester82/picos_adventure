draw_self();


if invun > 0 {
shader_set(shWhite);
draw_self();
shader_reset();
invun -= 1;
}