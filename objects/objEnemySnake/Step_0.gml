if (flying) {
	exit;
}

if (turn_check()) {
	hspeed *= -1;
	image_xscale *= -1;
}