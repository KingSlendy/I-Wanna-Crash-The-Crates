if (flying || collected || vspeed != 0) {
	exit;
}

if (ready && other.spinning) {
	fly();
	exit;
}

collect();