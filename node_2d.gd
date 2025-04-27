extends Node2D

var timer = 20

var note_preload = preload("Note.tscn")

func _process(_delta: float):
	timer -= 1
	if timer == 0:
		timer = 20
		var note = note_preload.instantiate()
		add_child(note)

func _input(ev):
	if Input.is_action_pressed("button1") and not ev.echo and get_tree().get_nodes_in_group("0"):
		var hit_note = get_tree().get_nodes_in_group("0")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_action_pressed("button2") and not ev.echo and get_tree().get_nodes_in_group("1"):
		var hit_note = get_tree().get_nodes_in_group("1")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_action_pressed("button3") and not ev.echo and get_tree().get_nodes_in_group("2"):
		var hit_note = get_tree().get_nodes_in_group("2")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_action_pressed("button4") and not ev.echo and get_tree().get_nodes_in_group("3"):
		var hit_note = get_tree().get_nodes_in_group("3")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_action_pressed("button5") and not ev.echo and get_tree().get_nodes_in_group("4"):
		var hit_note = get_tree().get_nodes_in_group("4")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_action_pressed("button6") and not ev.echo and get_tree().get_nodes_in_group("5"):
		var hit_note = get_tree().get_nodes_in_group("5")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_action_pressed("button7") and not ev.echo and get_tree().get_nodes_in_group("6"):
		var hit_note = get_tree().get_nodes_in_group("6")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_action_pressed("button8") and not ev.echo and get_tree().get_nodes_in_group("7"):
		var hit_note = get_tree().get_nodes_in_group("7")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
