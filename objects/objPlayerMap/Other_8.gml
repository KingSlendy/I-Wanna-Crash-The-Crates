sprite_index = sprPlayerIdle;

if (reversed) {
	path_reverse(moving);
	reversed = false;
}

moving = noone;
objLevelSign.show();