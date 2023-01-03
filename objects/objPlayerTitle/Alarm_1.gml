sprite_index = sprPlayerIdle;

if (irandom(1) == 1) {
	image_xscale *= -1;
}

hspeed = 0;
alarm[0] = get_frames(2);