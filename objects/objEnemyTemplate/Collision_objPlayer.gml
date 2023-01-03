if (flying) {
	exit;
}

if (lethal || !other.spinning) {
	kill_player();
} else {
	fly();
}