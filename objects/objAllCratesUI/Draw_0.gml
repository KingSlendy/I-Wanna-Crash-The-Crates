draw_self();
draw_set_font(fntAllCrates);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
crash_text(x, y + sprite_height / 2, string_interp("{0}/{1}", total - total_crates(), total));
draw_set_valign(fa_top);
draw_set_halign(fa_left);