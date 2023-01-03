draw_set_font(fntUI);
draw_set_halign(fa_center);
crash_text(400, y + 20, "I Wanna");
draw_sprite(sprTitleCrash, 0, 400, y + 150);
crash_text(400, y + 210, "The Crates");

draw_set_font(fntAllCrates);
crash_text(400, y + 500, text);
draw_sprite(sprWumpaFruit, 0, 40, y + 2115);
draw_sprite_ext(sprPowerCrystal, 0, 40, y + 2115 + 36, 1, 0.75, 0, c_white, 1);
draw_sprite(sprGemClear, 0, 40, y + 2115 + 95);