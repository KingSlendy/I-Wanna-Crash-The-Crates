alpha -= 0.03;
alpha = clamp(alpha, 0, 1);

if (moving == noone) {
	var selected = -1;
	
	if (is_pressed(global.controls.jump)) {
		room_goto(levels[global.current_level].level);
	}
	
	if (is_pressed(global.controls.left)) {
		selected = LEVEL_DIRECTIONS.LEFT;
	}
	
	if (is_pressed(global.controls.right)) {
		selected = LEVEL_DIRECTIONS.RIGHT;
	}
	
	if (is_pressed(global.controls.up)) {
		selected = LEVEL_DIRECTIONS.UP;
	}
	
	if (is_pressed(global.controls.down)) {
		selected = LEVEL_DIRECTIONS.DOWN;
	}
	
	if (selected != -1) {
		selected = levels[global.current_level].directions[selected];
		
		if (selected != noone) {
			var level = selected[DIRECTIONS_IDX.LEVEL_ID];
			
			if (global.clears[level]) {
				reversed = selected[DIRECTIONS_IDX.REVERSE];
				start_moving(selected[DIRECTIONS_IDX.PATH]);
				global.current_level = level;
				objLevelSign.hide();
			}
		}
	}
}