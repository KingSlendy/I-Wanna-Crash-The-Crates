seconds--;

if (seconds <= 0) {
	objRelic.visible = false;
	instance_destroy();
	exit;
}

alarm[0] = get_frames(1);