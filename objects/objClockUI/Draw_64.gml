draw_set_font(fntUI);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
crash_text(800, 608, string_copy(formatted_time(seconds), 3, 5));
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_sprite(sprite_index, 0, 800, 540);