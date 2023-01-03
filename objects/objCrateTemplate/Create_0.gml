image_speed = 0;
wood = true;
deadly = false;
wumpa_fruits = 1;
curve = animcurve_get(crvCrate);
curve_width = animcurve_get_channel(curve, "Width");
curve_height = animcurve_get_channel(curve, "Height");
curve_pos = 0;
curve_start = false;
curve_sprite = noone;
curve_previous = noone;

function change_sprite() {
	if (curve_sprite == noone) {
		curve_previous = sprite_index;
		curve_sprite = sprite_duplicate(sprite_index);
		sprite_index = curve_sprite;
		sprite_set_offset(curve_sprite, 16, 16);
		x += 16;
		y += 16;
	}
}

bounce = function() {
	if (wood && (objPlayer.spinning || deadly)) {
		return;
	}
	
	objPlayer.vspeed = -objPlayer.jump_height[2] * global.grav;
	
	if (object_index != objCrateTNT) {
		change_sprite();
		curve_pos = 0;
		curve_start = true;
		audio_play_sound(sndCrateBounce, 0, false);
	}
	
	action();
}

function destroy() {
	audio_stop_sound(sndCrateBounce);
	audio_stop_sound(sndCrateBreak);
	audio_play_sound(sndCrateBreak, 0, false);
	change_sprite();
	
	var part_type = part_type_create();
	part_type_sprite(part_type, sprCratePart, false, false, false);
	part_type_scale(part_type, 0.5, 1);
	part_type_size(part_type, 0.5, 0.5, 0, 0);
	part_type_blend(part_type, true);
	
	if (object_index == objCrateNitro) {
		part_type_colour1(part_type, c_lime);
	} else if (object_index == objCrateTNT) {
		part_type_colour1(part_type, c_red);
	}
	
	part_type_orientation(part_type, 0, 359, 7, 0, false);
	part_type_direction(part_type, 45, 135, 0, 0);
	part_type_speed(part_type, 1, 2, 0, 0);
	part_type_gravity(part_type, 0.1, 270);
	part_type_alpha2(part_type, 1, 0);
	part_type_life(part_type, 60, 60);
	
	part_particles_create(global.part_system, x, y, part_type, 1);
	part_particles_create(global.part_system, x, y, part_type, 1);
	part_particles_create(global.part_system, x - 15, y, part_type, 1);
	part_particles_create(global.part_system, x + 15, y, part_type, 1);
	part_particles_create(global.part_system, x, y - 15, part_type, 1);
	part_particles_create(global.part_system, x, y + 15, part_type, 1);
	
	part_type = part_type_create();
	part_type_shape(part_type, pt_shape_sphere);
	part_type_size(part_type, 0.3, 0.3, 0, 0);
	part_type_colour1(part_type, c_orange);
	part_type_blend(part_type, true);
	part_type_alpha2(part_type, 1, 0);
	part_type_life(part_type, 20, 20);
	
	part_particles_create(global.part_system, irandom_range(x - 5, x + 5), irandom_range(y - 5, y + 5), part_type, wumpa_fruits);
	instance_deactivate_object(id);
	
	repeat (wumpa_fruits) {
		with (instance_create_layer(x - 16, y - 16, "Instances", objWumpaFruit)) {
			hspeed = irandom_range(-1, 1);
			
			if (hspeed != 0) {
				if (check_object(hspeed, 0, objBlock)) {
					hspeed *= -1;
				}
				
				if (check_object(hspeed, 0, objBlock)) {
					hspeed = 0;
				}
			}
			
			vspeed = -7;
			
			if (check_object(0, vspeed, objBlock)) {
				vspeed = 0;
			}
			
			gravity = 0.5;
		
			if (!check_object(0, 32, objBlock)) {
				collect();
			}
		}
	}
	
	instance_activate_object(id);
	instance_destroy();
}

smash = function() {
	if (wood) {
		destroy();
	}
}

action = function() {}

function explode() {
	destroy();
	audio_stop_sound(sndCrateBreak);
	audio_stop_sound(sndCrateTNT);
	audio_stop_sound(sndCrateExplode);
	audio_play_sound(sndCrateExplode, 0, false);
	
	if (distance_to_object(objPlayer) < 26) {
		kill_player();
	}
	
	var part_type = part_type_create();
	part_type_shape(part_type, pt_shape_sphere);
	part_type_size(part_type, 0.2, 0.3, 0, 0);
	part_type_blend(part_type, true);
	
	if (object_index == objCrateNitro) {
		part_type_colour1(part_type, c_lime);
	} else {
		part_type_colour1(part_type, c_orange);
	}
	
	part_type_alpha3(part_type, 1, 1, 0);
	part_type_direction(part_type, 0, 359, 0, 0);
	part_type_speed(part_type, 0.5, 1.5, -0.01, 0);
	part_type_life(part_type, 30, 40);
	
	part_particles_create(global.part_system, x, y, part_type, 30);
}