var cam = camera_properties(0);

if (alarm[0] == -1 && (bbox_right < cam.view_x || bbox_left > cam.view_x + cam.view_w)) {
	image_xscale = 1;
	x = xstart;
	y = ystart;
	hspeed = 0;
	alarm[0] = irandom_range(get_frames(6), get_frames(12));
	alarm[1] = 0;
}