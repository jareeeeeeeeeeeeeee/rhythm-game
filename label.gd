extends Label

var songlist = []

var songtranslator = {
	"1ln": "「１」",
	"donfai": "Don't Fight the Music",
	"dune": "Dune",
	"end_of_miku": "The End of Hatsune Miku",
	"fire_dance": "Fire Dance",
	"mcls": "M@GICAL☆CURE! LOVE ♥ SHOT!",
	"miku": "Miku",
	"smile_symphony": "Smile Symphony"
}

func _ready():
	for image in DirAccess.get_files_at("res://Songlist/"):
		if image != image.trim_suffix(".jpg"):
			songlist.append(image.trim_suffix(".jpg"))

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	text = songtranslator.get(songlist[G.Current_Song])
	self.size = Vector2(1,1)
	self.position.x = 960 - self.size.x/2
