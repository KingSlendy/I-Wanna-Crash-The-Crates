image_speed = 0.333333333;
collected = false;
flying = false;
ready = false;
alarm[0] = 40;

function collect() {
	audio_stop_sound(sndWumpaFruit);
	audio_play_sound(sndWumpaFruit, 0, false);
	speed = 0;
	gravity = 0;
	objWumpaUI.update();
	collected = true;
}

function fly() {
	motion_set(point_direction(other.x, other.y, x + 15, y + 15), 20);
	flying = true;
	audio_play_sound(sndCherry, 0, false);
}