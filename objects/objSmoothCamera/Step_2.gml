var cam = camera_properties(0);

if (instance_exists(objPlayer)) {
	target_x = objPlayer.x - cam.view_w / 2;
	target_y = objPlayer.y - cam.view_h / 2;
}

now_x = lerp(now_x, target_x, view_spd);
now_y = lerp(now_y, target_y, view_spd);

if (!leave_room) {
	now_x = clamp(now_x, 0, room_width - cam.view_w);
	now_y = clamp(now_y, 0, room_height - cam.view_h);
}

var length = array_length(layers);

for (var i = 0; i < length; i++) {
	layer_x(layers[i], now_x * 0.5 * (0.5 * i));
}

camera_set_view_pos(cam.view_cam, now_x, now_y);

cam = camera_properties(0);
instance_activate_all();
instance_deactivate_region(cam.view_x - 100, cam.view_y - 100, cam.view_w + 100, cam.view_h + 100, false, true);
instance_activate_object(objWorld);
instance_activate_object(objGameOver);
instance_activate_object(objTemplateUI);
instance_activate_object(objBlock);
instance_activate_object(objCrateTNT);
instance_activate_object(objCrateNitro);
instance_activate_object(objEnemyTemplate);
instance_activate_object(objTeleportPlayer);
instance_activate_object(objRelic);
instance_activate_object(objSpotlightUI);