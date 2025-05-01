extends Label

var notes = {"perfect":0,"great":0,"good":0,"bad":0,"miss":0}

func _process(delta: float):
	text = "Perfect: " + str(notes["perfect"]) + "\nGreat: " + str(notes["great"]) + "\nGood: " + str(notes["good"]) + "\nBad: " + str(notes["bad"]) + "\nMiss: " + str(notes["miss"])
