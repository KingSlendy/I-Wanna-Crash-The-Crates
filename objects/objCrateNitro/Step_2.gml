if (instance_exists(objPlayer)) {
	if (check_object(objPlayer.hspeed * -1, 0, objPlayer) || check_object(0, objPlayer.vspeed * -1, objPlayer)) {
		smash();
	}
}