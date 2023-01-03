text = @"
Game originally made for
Mauricio Juega IWBT

Hope you had a great birthday
and enjoyed the game, Mauri!


- Creator -
KingSlendy

- Engine -
I Wanna Be The King GMS2 Engine


- Assets -
Crash Bandicoot
Donkey Kong Country
Terraria
Spriters Resource
Textures Resource

- Music -
Crash Bandicoot

- Testers -
lukz.#2536
Kaden#1335
FukoSan#8970
PlayerDash2017#4926
AlejoFangamer#9140




Wumpa Fruits: $c1 / 500 ($p1%)
Power Crystals: $c2 / 5 ($p2%)
Clear Gems: $c3 / 5 ($p3%)


Final Game Completion: $p4%



Press $w to return to map
";

var hundred = function(v1, v2) {
	return floor(clamp(v1 / v2, 0, 1) * 100);
}

var collected = [
	global.fruits,
	clamp(array_count(global.items.crystals, true), 0, 5),
	clamp(array_count(global.items.gems, true), 0, 5)
];

for (var i = 0; i < 3; i++) {
	text = string_replace(text, "$c" + string(i + 1), string(collected[i]));
}

var percentages = [
	hundred(collected[0], 500),
	hundred(collected[1], 5),
	hundred(collected[2], 5)
];

percentages[3] = floor((percentages[0] + percentages[1] + percentages[2]) / 3);

if (array_count(global.items.relics, true) == 5) {
	percentages[3]++;
}

for (var i = 0; i < 4; i++) {
	text = string_replace(text, "$p" + string(i + 1), string(percentages[i]));
}

text = string_replace(text, "$w", control_bind(global.controls.warp));
alarm[0] = get_frames(2);