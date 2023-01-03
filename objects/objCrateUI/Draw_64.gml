draw_sprite_ext(sprCrateUI, 0, x, y, 1.5, 1.5, 0, c_white, 1);
draw_set_font(fntUI);
crash_text(x + 60, y, string_interp("{0}/{1}", total - total_crates(), total));