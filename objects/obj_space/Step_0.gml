image_alpha = sin(time/20)*1;
time++;
depth = -100;

if keyboard_check_pressed(vk_space) == true {
	instance_destroy();	
}