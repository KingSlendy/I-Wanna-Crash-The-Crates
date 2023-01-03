sprite_index = sprPlayerFall;
vspeed = -5;
fade = true;
audio_play_sound(sndTeleportPad, 0, false);
audio_sound_gain(global.current_music, 0, 2000);
global.clears[global.current_level + 1] = true;
save_game(false);

alarm[1] = get_frames(2);