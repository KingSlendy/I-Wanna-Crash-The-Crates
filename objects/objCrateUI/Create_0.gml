x = 300;
y = -100;
target_y = y;

function update() {
	target_y = 10;
	alarm[0] = get_frames(3);
}

function total_crates() {
	return instance_number(objCrateTemplate) - instance_number(objCrateIronSpring) - instance_number(objCrateNitro);
}