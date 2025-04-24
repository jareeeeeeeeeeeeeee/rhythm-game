extends Node2D

var timer = 60

var note_preload = preload("Note.tscn")

func _process(_delta: float):
	timer -= 1
	if timer == 0:
		timer = 60
		var note = note_preload.instantiate()
		
		add_child(note)
