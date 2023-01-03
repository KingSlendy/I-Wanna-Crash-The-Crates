event_inherited();
wumpa_fruits = 0;

action = function() {
	bounce = noone;
	audio_play_sound(sndCrateTNT, 0, false);
	alarm[0] = get_frames(4);
	alarm[1] = 1;
}

smash = explode;