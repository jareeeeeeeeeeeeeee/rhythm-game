extends Label

var notes = {"perfect":0,"great":0,"good":0,"bad":0,"miss":0}

func _process(delta: float):
	text = "Perfect: " + str(notes["perfect"]) + "\nGreat: " + str(notes["great"]) + "\nGood: " + str(notes["good"]) + "\nBad: " + str(notes["bad"]) + "\nMiss: " + str(notes["miss"])

func _input(ev):
	if Input.is_key_pressed(KEY_A) and not ev.echo:
		notes["perfect"] += 1
	if Input.is_key_pressed(KEY_S) and not ev.echo:
		notes["great"] += 1
	if Input.is_key_pressed(KEY_D) and not ev.echo:
		notes["good"] += 1
	if Input.is_key_pressed(KEY_F) and not ev.echo:
		notes["bad"] += 1
	if Input.is_key_pressed(KEY_G) and not ev.echo:
		notes["miss"] += 1
