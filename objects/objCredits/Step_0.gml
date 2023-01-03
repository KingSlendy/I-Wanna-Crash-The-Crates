if (y <= -2000) {
	vspeed = 0;
}

if (y != -2000 && is_pressed(global.controls.jump)) {
	y = -2000;
	vspeed = 0;
	alarm[0] = 0;
}