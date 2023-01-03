if (instance_exists(objPlayer)) {
	instance_destroy(objPlayer);
}

with (objLevelSpace) {
	if (ID == global.current_level) {
		other.x = x + sprite_width / 2;
		other.y = y + sprite_height / 2;
		break;
	}
}

save_game(true);