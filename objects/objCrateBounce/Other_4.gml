action = function() {
	if (remaining <= 0) {
		destroy();
		exit;
	}
	
	remaining--;
	timer = 40;
	
	with (instance_create_layer(x - 15, y - 15, "Instances", objWumpaFruit)) {
		collect();
	}
}