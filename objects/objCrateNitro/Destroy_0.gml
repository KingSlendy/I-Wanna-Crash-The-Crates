var coord_x = [32, 32, 0, -32, -32, -32, 0, 32];
var coord_y = [0, -32, -32, -32, 0, 32, 32, 32];
	
for (var i = 0; i < 8; i++) {
	with (instance_place(x + coord_x[i], y + coord_y[i], objCrateTemplate)) {
		alarm[0] = get_frames(0.25);
	}
}

with (objEnemyTemplate) {
	if (!flying && distance_to_object(other) < 26) {
		fly();
	}
}
	
with (objWumpaFruit) {
	if (distance_to_object(other) < 26) {
		fly();
	}
}

event_inherited();