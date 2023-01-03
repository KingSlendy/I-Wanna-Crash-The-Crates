var cam = camera_properties(0);

if (!surface_exists(surf)) {
	surf = surface_create(cam.view_w, cam.view_h);
}

surface_set_target(surf);
draw_clear(c_black);
gpu_set_blendmode(bm_subtract);
draw_sprite(sprite_index, 0, px - cam.view_x, py - cam.view_y);
gpu_set_blendmode(bm_normal);
surface_reset_target();

draw_set_alpha(0.75);
draw_surface(surf, cam.view_x, cam.view_y);
draw_set_alpha(1);