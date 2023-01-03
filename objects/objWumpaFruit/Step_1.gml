if (flying || collected) {
	exit;
}

if (check_object(hspeed, 0, objBlock)) {
	hspeed = 0;
}

if (check_object(0, vspeed, objBlock)) {
	if (vspeed > 0) {
		gravity = 0;
	}
	
	hspeed = 0;
	vspeed = 0;
}