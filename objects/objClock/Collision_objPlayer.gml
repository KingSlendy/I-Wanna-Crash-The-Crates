objRelic.visible = true;

with (instance_create_layer(0, 0, "Instances", objClockUI)) {
	seconds = other.seconds;
}

var part_type = part_type_create();
part_type_sprite(part_type, sprite_index, false, false, false);
part_type_size(part_type, 1, 1, 0.025, 0);
part_type_alpha2(part_type, 1, 0);
part_type_life(part_type, 40, 40);
part_particles_create(global.part_system, x, y, part_type, 1);
audio_play_sound(sndClockStart, 0, false);
//audio_play_sound(sndClockTick, 0, true);
instance_destroy();