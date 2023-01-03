function crash_text(x, y, str) {
	draw_text_outline(x, y, str, c_black);
	var c1 = c_orange;
	var c2 = make_color_rgb(209, 112, 0);
	draw_text_color(x, y, str, c1, c1, c2, c2, draw_get_alpha());
}