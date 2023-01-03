if (check_object(0, 0, objPlayer)) {
	instance_destroy(id, false);
	exit;
}

event_inherited();
wumpa_fruits = 0;

action = function() {
	destroy();
}

smash = action;