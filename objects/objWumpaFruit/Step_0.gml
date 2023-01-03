if (collected) {
	var cam = camera_properties(0);
	x = lerp(x, cam.view_x + 15, 0.3);
	y = lerp(y, cam.view_y + 15, 0.3);
	
	if (distance_to_point(cam.view_x + 15, cam.view_y + 15) < 8) {
		audio_stop_sound(sndWumpaFruitCollect);
		audio_play_sound(sndWumpaFruitCollect, 0, false);
		global.fruits = clamp(global.fruits + 1, 0, 500);
		instance_destroy();
	}
}