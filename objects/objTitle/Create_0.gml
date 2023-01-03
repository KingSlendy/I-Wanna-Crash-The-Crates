selections = [
	"Start Game",
	"Load Game",
	"Options"
];

selected = 0;

if (file_exists("Data1")) {
	selected = 1;
}

ang = 0;