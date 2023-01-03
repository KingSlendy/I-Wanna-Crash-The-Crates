ang = 0;
move = true;

function collect() {
	var part_type = part_type_create();
	part_type_shape(part_type, pt_shape_sphere);
	part_type_size(part_type, 0.1, 0.2, 0, 0);
	part_type_color1(part_type, c_white);
	part_type_alpha2(part_type, 1, 0);
	part_type_blend(part_type, true);
	part_type_direction(part_type, 0, 359, 0, 0);
	part_type_speed(part_type, 0.1, 0.5, 0, 0);
	part_type_life(part_type, 30, 30);

	repeat (30) {
		part_particles_create(global.part_system, irandom_range(bbox_left, bbox_right), irandom_range(bbox_top, bbox_bottom), part_type, 1);
	}

	global.items.relics[global.current_level] = true;
	audio_play_sound(sndPowerCrystal, 0, false);
	instance_destroy(objClockUI);
	instance_destroy();
}