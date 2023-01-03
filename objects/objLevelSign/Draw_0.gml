draw_self();

if (layer_sequence_is_finished(sequence)) {
	draw_set_font(fntLevelSign);
	draw_set_halign(fa_center);
	crash_text(x - sprite_xoffset + sprite_width / 2, y + 90, objPlayerMap.levels[global.current_level].name);
	draw_set_halign(fa_left);
	
	if (global.current_level != 5) {
		draw_sprite_ext(sprPowerCrystal, 0, x, y + 105, 1, 1, 0, (global.items.crystals[global.current_level]) ? c_white : c_black, 1);
		draw_sprite_ext(sprGemClear, 0, x + 55, y + 120, 1.5, 1.5, 0, (global.items.gems[global.current_level]) ? c_white : c_black, 1);
		
		if (global.items.relics[global.current_level]) {
			draw_sprite_ext(sprRelic, 0, x + 125, y + 95, 1, 1, 25, c_white, 1);
		}
	}
}