sequence = noone;
pos = 0;

function show() {
	if (layer_sequence_exists("Sequences", sequence)) {
		pos = layer_sequence_get_headpos(sequence);
		layer_sequence_destroy(sequence);
	}
	
	sequence = layer_sequence_create("Sequences", 0, 0, seqLevelSign);
	sequence_instance_override_object(layer_sequence_get_instance(sequence), objLevelSign, id);
	layer_sequence_headpos(sequence, pos);
}

function hide() {
	show();
	layer_sequence_speedscale(sequence, -1);
}

show();