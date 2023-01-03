depth = -500;
image_speed = 0.2;
alpha = 1;

function Level(level, name, directions) constructor {
	self.level = level;
	self.name = name;
	self.directions = directions;
}

levels = [
	new Level(rBeach, "Beach Side", [
		noone,
		[1, pthMap1, false],
		[5, pthMap5, false],
		noone
	]),
	
	new Level(rTiki, "Tiki Jungle", [
		noone,
		[2, pthMap2, false],
		[0, pthMap1, true],
		noone
	]),
	
	new Level(rSunset, "Sunset Water", [
		[1, pthMap2, true],
		noone,
		[3, pthMap3, false],
		noone
	]),
	
	new Level(rMountain, "High Mountain", [
		noone,
		[4, pthMap4, false],
		noone,
		[2, pthMap3, true]
	]),
	
	new Level(rTown, "Ghost Town", [
		noone,
		noone,
		[3, pthMap4, true],
		noone
	]),
	
	new Level(rCredits, "Credits", [
		noone,
		noone,
		noone,
		[0, pthMap5, true]
	])
];

enum LEVEL_DIRECTIONS {
	LEFT,
	RIGHT,
	UP,
	DOWN
}

enum DIRECTIONS_IDX {
	LEVEL_ID,
	PATH,
	REVERSE
}

var n = 1;
var sep = 250;
var last_x, last_y, now_x, now_y;

while (true) {
	var path = asset_get_index("pthMap" + string(n));
	
	if (path == -1) {
		break;
	}
	
	for (var i = 0; i < 1; i += 1 / sep) {
	    now_x = path_get_x(path, i);
	    now_y = path_get_y(path, i);

	    if (i > 0) {
	        with (instance_create_layer(now_x, now_y, "Paths", objLevelPath)) {
				ID = n;
	            image_angle = point_direction(last_x, last_y, now_x, now_y);
	        }
	    }
    
	    last_x = now_x;
	    last_y = now_y;
	}
	
	n++;
}

moving = noone;
reversed = false;

function start_moving(path) {
	sprite_index = sprPlayerRun;
	image_xscale = (reversed) ? -1 : 1;
	
	if (reversed) {
		path_reverse(path);
	}
	
	path_start(path, 3, path_action_stop, true);
	moving = path;
}