if (hspeed != 0 && check_object(hspeed, 0, objBlock)) {
	hspeed *= -1;
	image_xscale *= -1;
}

if (vspeed > 0) {
	if (check_object(0, vspeed, objBlock)) {
		image_speed = 0;
		image_index = 0;
		hspeed = 0;
		vspeed = 0;
		gravity = 0;
		alarm[0] = get_frames(0.75);
	}
} else if (vspeed < 0) {
	if (check_object(0, vspeed, objBlock)) {
		vspeed = 0;
	}
}