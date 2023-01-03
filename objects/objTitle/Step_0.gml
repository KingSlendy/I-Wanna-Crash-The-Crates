if (is_pressed(global.controls_menu.up)) {
	selected--;

	if (selected == 1 && !file_exists("Data1")) {
		selected--;
	}
	
	audio_play_sound(sndWumpaFruitCollect, 0, false);
}

if (is_pressed(global.controls_menu.down)) {
	selected++;
	
	if (selected == 1 && !file_exists("Data1")) {
		selected++;
	}
	
	audio_play_sound(sndWumpaFruitCollect, 0, false);
}

selected = (selected + 3) % 3;

if (is_pressed(global.controls_menu.accept)) {
	switch (selected) {
		case 0: start_game(0); break;
		case 1: start_game(1); break;
		case 2: room_goto(rOptions); break;
	}
	
	audio_play_sound(sndWumpaFruit, 0, false);
}

image_angle = lengthdir_x(7, ang);
image_xscale = 0.9 + lengthdir_y(0.1, ang);
ang = (ang + 360 + 5) % 360;