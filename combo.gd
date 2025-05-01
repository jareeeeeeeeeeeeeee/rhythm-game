extends Label

var combo = 0

func _process(dt: float):
	if combo:
		text = "Combo\n"  + str(combo)
