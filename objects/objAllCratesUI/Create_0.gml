depth = 200;
image_alpha = 0.78;

function total_crates() {
	return instance_number(objCrateTemplate) - instance_number(objCrateIronSpring) - instance_number(objCrateNitro);
}