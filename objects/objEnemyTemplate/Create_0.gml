lethal = false;
flying = false;

function fly() {
	image_speed = 0;
	motion_set(point_direction(other.x, other.y, x, y - sprite_yoffset / 2), 20);
	flying = true;
	audio_play_sound(sndCherry, 0, false);
}

function turn_check() {
	return (check_object(hspeed, 0, objBlock) || !collision_point(x + sprite_xoffset / 2, y, objBlock, false, false));
}