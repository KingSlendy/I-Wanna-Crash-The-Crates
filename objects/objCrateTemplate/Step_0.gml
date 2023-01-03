if (distance_to_object(objPlayer) < 6 && objPlayer.spinning) {
	smash();
	exit;
}

if (curve_start) {
	curve_pos += 0.1;
	image_xscale = animcurve_channel_evaluate(curve_width, curve_pos);
	image_yscale = animcurve_channel_evaluate(curve_height, curve_pos);
	
	if (curve_pos >= 1) {
		sprite_index = curve_previous;
		x -= 16;
		y -= 16;
		sprite_delete(curve_sprite);
		curve_sprite = noone;
		curve_pos = 0;
		curve_start = false;
	}
}