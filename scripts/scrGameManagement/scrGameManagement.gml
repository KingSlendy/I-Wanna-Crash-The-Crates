function save_game(position) {
	if (position) {
		if (instance_exists(objPlayer)) {
			global.save_player.sroom = room_get_name(room);
			global.save_player.sx = objPlayer.x;
			global.save_player.sy = objPlayer.y;
			global.save_player.sgrav = global.grav;
		} else {
			global.save_player.sroom = room_get_name(rMap);
		}
	}
	
	var data = {
		player: global.save_player,
		info: {
			difficulty: global.difficulty,
			deaths: global.deaths,
			time: global.time,
			clears: global.clears
		},
		
		items: global.items,
		game: {
			level: global.current_level,
			fruits: global.fruits
		}
	};
	
	var json = json_stringify(data);
	save_file(string_interp("Data{0}", global.save_num + 1), json, true);
	
	#region Online
	if (global.connected && !global.online.race && position) {
		var __ONLINE_p = objPlayer;
				
		with (objWorld) {
			buffer_seek(__ONLINE_buffer, buffer_seek_start, 0);
				
			if (instance_exists(__ONLINE_p)) {
				buffer_write(__ONLINE_buffer, buffer_u8, 5);
				buffer_write(__ONLINE_buffer, buffer_u8, global.grav);
				buffer_write(__ONLINE_buffer, buffer_s32, __ONLINE_p.x);
				buffer_write(__ONLINE_buffer, buffer_f64, __ONLINE_p.y);
				buffer_write(__ONLINE_buffer, buffer_s16, room);
				buffer_write_uv(__ONLINE_buffer);
				network_send_raw(__ONLINE_socket, __ONLINE_buffer, buffer_tell(__ONLINE_buffer));
			}
		}
	}
	#endregion
}

function load_game(position) {
	if (instance_exists(objPlayer)) {
		instance_destroy(objPlayer);
	}
	
	var json = load_file(string_interp("Data{0}", global.save_num + 1), true);
	var data = json_parse(json);
	
	global.save_player = data.player;
	global.deaths = data.info.deaths;
	global.time = data.info.time;
	global.difficulty = data.info.difficulty;
	global.clears = data.info.clears;
	global.items = data.items;
	global.current_level = data.game.level;
	global.fruits = data.game.fruits;
	
	if (position) {
		global.game_started = true;
		global.auto_save = false;
		global.grav = global.save_player.sgrav;
		instance_create_layer(global.save_player.sx, global.save_player.sy, "Instances", objPlayer);
		room_goto(asset_get_index(global.save_player.sroom));
	}
	
	#region Online
	if (global.connected && !global.online.race && position) {
		with (objWorld) {
			if (__ONLINE_sSaved) {
				if (room_exists(__ONLINE_sRoom)) {
					var __ONLINE_p = objPlayer;

					if (global.grav != __ONLINE_sGravity) {
						flip_grav();
					}

					__ONLINE_p.x = __ONLINE_sX;
					__ONLINE_p.y = __ONLINE_sY;
					room_goto(__ONLINE_sRoom);
				}
		
				__ONLINE_sSaved = false;
			}
		}
	}
	#endregion
}

function cleanup_game() {
	global.grav = 1;
	global.deaths = 0;
	global.time = 0;
	global.clears = array_create(6, false);
	global.items = {
		gems: array_create(5, false),
		crystals: array_create(5, false),
		relics: array_create(5)
	};
	
	global.current_level = 0;
	global.fruits = 0;
}

function start_game(diff) {
	var save = string_interp("Data{0}", global.save_num);
	var length = array_length(global.difficulties);

	if (diff == length - 1) {
	    load_game(true);
	} else {
		diff = clamp(diff, 0, length - 1);

	    if (file_exists(save)) {
	        file_delete(save);
	    }
		
        cleanup_game();
	    global.game_started = true;
	    global.auto_save = true;
	    global.difficulty = diff;

	    instance_destroy(objPlayer);
	    room_goto(global.start_room);
	}
}

function restart_game() {
	if (room == rMap) {
		return;
	}
	
	if (global.death_music) {
	    audio_stop_sound(bgmGameOver);
	    audio_resume_sound(global.current_music);
	}
	
	var deaths = global.deaths;
	var time = global.time;
	load_game(true);
	global.deaths = deaths;
	global.time = time;
	
	part_system_clear(global.part_system);
	audio_stop_sound(sndCrateTNT);
}

function save_config() {
	var data = {
		display: global.display,
		controls: global.controls,
		online: global.online,
	};
	
	var json = json_stringify(data);
	save_file("Config.ini", json, false);
}

function load_config() {
	if (!file_exists("Config.ini")) {
		save_config();
	}
	
	var json = load_file("Config.ini", false);
	var data = json_parse(json);
	
	global.display = data.display;
	global.controls = data.controls;
	global.online = data.online;
	
	set_display();
}

function set_display() {
	window_set_fullscreen(global.display.fullscreen);
	
	if (global.display.vsync) {
		display_reset(0, global.display.vsync);
	}
	
	display_set_gui_size(surface_get_width(application_surface), surface_get_height(application_surface));
}

function change_volume() {
	var dir = (is_held(global.controls.right) - is_held(global.controls.left));
	global.display.vol += 0.01 * dir;
	global.display.vol = clamp(global.display.vol, 0, 1);
}