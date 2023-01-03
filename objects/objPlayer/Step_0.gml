#region Movement
var dir = (is_held(global.controls.right) - is_held(global.controls.left));

if (frozen) {
	dir = 0;
}

on_block = check_object(0, global.grav, objBlock);
var on_platform = instance_place(x, y + ((vspeed != 0) ? vspeed : global.grav), objPlatform);
var on_vineR = (place_meeting(x - 1, y, objVineR) && !on_block);
var on_vineL = (place_meeting(x + 1, y, objVineL) && !on_block);
gravity = (!on_block && !platform_top(on_platform)) ? 0.4 * global.grav : 0;

if (!momentum) {
	if (dir != 0) {
		if (!on_vineR && !on_vineL) {
			xscale = dir;
		}
	
		if ((dir == 1 && !on_vineR) || (dir == -1 && !on_vineL)) {
			hspeed = max_hspeed * dir;
			image_speed = 0.5;
			sprite_index = PLAYER_ACTIONS.RUN;
		}
	} else {
		hspeed = 0;
		image_speed = 0.2;
		sprite_index = PLAYER_ACTIONS.IDLE;
	}
} else {
	sprite_index = PLAYER_ACTIONS.RUN;
	hspeed += 0.1 * -sign(hspeed);
	print(hspeed);
	
	if (hspeed * sign(hspeed) == 0) {
		hspeed = 0;
		momentum = false;
	}
}

if (vspeed * global.grav < 0) {
	sprite_index = PLAYER_ACTIONS.JUMP;
} else if (vspeed * global.grav > 0) {
	sprite_index = PLAYER_ACTIONS.FALL;
}

if (abs(vspeed) > max_vspeed) {
	vspeed = max_vspeed * sign(vspeed);
}

if (!frozen) {
	if (is_pressed(global.controls.jump)) {
		if (jump_total > 0 && (on_block || on_platform != noone)) {
			vspeed = -(jump_height[0] * global.grav);
			sprite_index = PLAYER_ACTIONS.JUMP;
			reset_jumps();
			audio_play_sound(sndJump, 0, false);
		} else if (jump_left > 0 || place_meeting(x, y, objWater) || jump_total == -1) {
			vspeed = -(jump_height[1] * global.grav);
			sprite_index = PLAYER_ACTIONS.JUMP;
			
			if (!place_meeting(x, y, objWaterRefresh)) {
				if (jump_left > 0) {
					jump_left--;
				}
			} else {
				reset_jumps();
			}
			
			audio_play_sound(sndDoubleJump, 0, false);
		}
	}
	
	if (is_released(global.controls.jump)) {
		if (vspeed * global.grav < 0) {
			vspeed *= 0.45;
		}
	}
	
	if (!spinning && is_pressed(global.controls.shoot)) {
		spinning = true;
		gravity = 0;
		alarm[0] = get_frames(0.5);
		audio_play_sound(sndSpin, 0, false);
	}
	
	if (on_vineR || on_vineL) {
		xscale = (on_vineR) ? 1 : -1;
	    vspeed = 2 * global.grav;
		image_speed = 0.5;
	    sprite_index = PLAYER_ACTIONS.SLIDE;
    
	    if ((on_vineR && is_pressed(global.controls.right)) || (on_vineL && is_pressed(global.controls.left))) {
	        if (is_held(global.controls.jump)) {
	            hspeed = (on_vineR) ? 15 : -15;
	            vspeed = -9 * global.grav;
	            sprite_index = PLAYER_ACTIONS.JUMP;
				audio_play_sound(sndVine, 0, false);
	        } else {
	            hspeed = (on_vineR) ? 3 : -3;
	            sprite_index = PLAYER_ACTIONS.FALL;
	        }
	    }
	}
	
	if (spinning) {
		image_speed = 0.9;
		sprite_index = PLAYER_ACTIONS.SPIN;
	}
	
	if (global.debug_enable && on_block) {
		dir = (is_pressed(global.controls_debug.alignR) - is_pressed(global.controls_debug.alignL));
		
		if (dir != 0) {
			hspeed = dir;
		}
	}
}
#endregion

#region Block Collisions
if (check_object(hspeed, 0, objBlock)) {
	x = (hspeed > 0) ? floor(x) : ceil(x);
	
	while (!check_object(sign(hspeed), 0, objBlock)) {
		x += sign(hspeed);
		
		if (check_killer()) {
			break;
		}
	}
	
	hspeed = 0;
}

if (check_object(0, vspeed, objBlock)) {
	y = (vspeed > 0) ? floor(y) : ceil(y);
	
	while (!check_object(0, sign(vspeed), objBlock)) {
		y += sign(vspeed);
		
		if (check_killer()) {
			break;
		}
	}
	
	var bounced = false;
	
	with (instance_place(x, y + sign(vspeed), objCrateTemplate)) {
		if (other.vspeed * global.grav > 0) {
			bounced = true;
		}
		
		if (bounce != noone) {
			bounce();
		} else {
			bounced = false;
		}
	}
	
	if (vspeed * global.grav > 0) {
		reset_jumps();
	}
	
	if (!bounced) {
		vspeed = 0;
		gravity = 0;
	}
}

if (check_object(hspeed, vspeed, objBlock)) {
	hspeed = 0;
}

if (vspeed * global.grav > 0) {
	if (platform_top(on_platform)) {
		y = (vspeed > 0) ? floor(y) : ceil(y);
	
		while (!check_object(0, global.grav, objPlatform)) {
			y += global.grav;
		
			if (check_killer()) {
				break;
			}
		}
	
		reset_jumps();
		vspeed = 0;
		gravity = 0;
	}
}
#endregion