draw_set_alpha(image_alpha);
draw_set_font(fntGameOver);
draw_set_halign(fa_center);
crash_text(display_get_gui_width() / 2, 200, "GAME OVER");
draw_set_font(fntAllCrates);
crash_text(display_get_gui_width() / 2, 325, "Press R To Retry");
draw_set_halign(fa_left);
draw_set_alpha(1);