if (flying) {
	exit;
}

if (check_object(hspeed, 0, objBlock)) {
	hspeed *= -1;
	image_xscale *= -1;
}