draw_set_font(fntUI);
draw_set_halign(fa_center);
crash_text(400, 20, "I Wanna");
draw_sprite_ext(sprTitleCrash, 0, 400, 150, image_xscale, image_xscale, image_angle, c_white, 1);
crash_text(400, 210, "The Crates");

draw_set_font(fntAllCrates);
draw_set_halign(fa_left);

for (var i = 0; i < 3; i++) {
	if (i == selected) {
		draw_sprite(sprTitleArrow, 0, 95, 425 + 40 * i);
	}
	
	if (i == 1 && !file_exists("Data1")) {
		draw_set_alpha(0.25);
	} else {
		draw_set_alpha(1);
	}
	
	crash_text(100, 400 + 40 * i, selections[i]);
	draw_set_alpha(1);
}

draw_set_font(fntLevelSign);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
crash_text(800, 608, "Made by KingSlendy");
draw_set_valign(fa_top);
draw_set_halign(fa_left);