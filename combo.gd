extends Label

func _process(dt: float):
	if G.combo:
		text = "Combo\n"  + str(G.combo)
	else:
		text = ""
