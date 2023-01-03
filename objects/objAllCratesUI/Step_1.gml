if (distance_to_object(objPlayer) < 96 && total_crates() <= 0) {
	with (instance_create_layer(x - sprite_width / 2, y + sprite_height / 2, "Instances", objGemClear)) {
		ID = other.ID;
		vspeed = -7;
		gravity = 0.4;
	}
	
	instance_destroy();
}