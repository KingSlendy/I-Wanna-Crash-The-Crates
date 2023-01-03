if (flying) {
	exit;
}

if (instance_exists(objPlayer)) {
	if (objPlayer.y < y - sprite_yoffset * 0.75) {
		lethal = true;
	} else {
		if ((image_xscale == 1 && objPlayer.x < bbox_left) || (image_xscale == -1 && objPlayer.x > bbox_right)) {
			lethal = true;
		} else {
			lethal = false;
		}
	}
}

if (turn_check()) {
	hspeed *= -1;
	image_xscale *= -1;
}