variable_global_set(string_interp("global.items.{0}[{1}]", type, num), true);

if (global.auto_save_items) {
	save_game(false);
}

audio_play_sound(sndItem, 0, false);
instance_destroy();