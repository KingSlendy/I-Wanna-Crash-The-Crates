function play_music(music, loop) {
	if (!audio_is_playing(music)) {
	    audio_stop_sound(global.current_music);
    
	    if (music != -1) {
	        global.current_music = audio_play_sound(music, 0, loop);
	    } else {
	        global.current_music = music;
	    }
	}
}

function stop_music() {
	if (global.current_music != -1) {
	    audio_stop_sound(global.current_music);
	    global.current_music = -1;
	}
}

function get_music() {
	var music;
	var loop = true;

	switch (room) {
		case rTiki: music = bgmTiki; break;
		case rSunset: music = bgmSunset; break;
		case rMountain: music = bgmMountain; break;
		case rTown: music = bgmTown; break;
	    default: music = bgmMain; break;
	}

	if (music != -2) {
	    play_music(music, loop);
	}
}