part_type = part_type_create();
part_type_shape(part_type, pt_shape_smoke);
part_type_size(part_type, 0.1, 0.2, 0, 0);
part_type_color3(part_type, c_orange, c_orange, c_yellow);
part_type_alpha3(part_type, 1, 1, 0);
part_type_blend(part_type, true);
part_type_direction(part_type, 90, 90, 0, 10);
part_type_speed(part_type, 0.5, 1.5, 0, 0);
part_type_life(part_type, 60, 60);

part_emitter = part_emitter_create(global.part_system);
part_emitter_region(global.part_system, part_emitter, bbox_left + 5, bbox_right - 5, bbox_bottom + 8, bbox_bottom + 8, ps_shape_line, ps_distr_linear);
part_emitter_stream(global.part_system, part_emitter, part_type, 1);