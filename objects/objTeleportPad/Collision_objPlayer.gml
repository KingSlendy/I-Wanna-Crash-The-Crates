if (other.bbox_left >= bbox_left + 16 && other.bbox_right <= bbox_right - 16 && other.on_block) {
	if (instance_exists(objRelic) && objRelic.visible) {
		with (objRelic) {
			collect();
		}
	}
	
	with (objPlayer) {
		instance_create_layer(x, y, "Instances", objTeleportPlayer);
		instance_destroy();
	}
	
	part_emitter_destroy(global.part_system, part_emitter);
}