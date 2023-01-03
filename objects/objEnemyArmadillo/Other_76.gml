if (event_data[? "event_type"] == "sprite event") {
	var message = event_data[? "message"];
	
	switch (message) {
		case "Roll": rolling++; break;
		
		case "Again":
			if (++rolling >= 4) {
				image_index = 12;
			} else {
				image_index = 4;
			}
			break;
			
		case "Restart":
			image_speed = 0;
			hspeed = 0;
			rolling = 0;
			alarm[0] = get_frames(0.5);
			break;
	}
}