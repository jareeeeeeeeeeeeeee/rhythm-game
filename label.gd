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
	text = songtranslator.get(songlist[G.Current_Song])

func _scrol_left():
	if Input.is_action_just_pressed("Menu Scroll Left"):
		text = songtranslator.get(songlist[G.Current_Song])
		
		
func _scrol_right():
	if Input.is_action_just_pressed("Menu Scroll Right"):
		text = songtranslator.get(songlist[G.Current_Song])


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	_scrol_left()
	_scrol_right()
