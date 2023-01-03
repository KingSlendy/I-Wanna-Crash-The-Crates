if (flying) {
	exit;
}

with (other) {
	if (y <= other.bbox_top && vspeed * global.grav > 0) {
		y = other.bbox_top - sprite_yoffset;
		vspeed = -jump_height[2] * global.grav;
		audio_play_sound(sndCrateBounce, 0, false);
		exit;
	} else if (other.rolling > 0) {
		if (spinning) {
			var dir = (x > other.x) ? 1 : -1;
			hspeed = max_hspeed * dir;
			momentum = true;
			exit;
		}
	}
}

if (other.spinning) {
	fly();
} else {
	kill_player();
}