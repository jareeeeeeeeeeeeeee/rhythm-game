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
	if Input.is_key_pressed(KEY_A) and not ev.echo and get_tree().get_nodes_in_group("0"):
		var hit_note = get_tree().get_nodes_in_group("0")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_key_pressed(KEY_S) and not ev.echo and get_tree().get_nodes_in_group("1"):
		var hit_note = get_tree().get_nodes_in_group("1")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_key_pressed(KEY_D) and not ev.echo and get_tree().get_nodes_in_group("2"):
		var hit_note = get_tree().get_nodes_in_group("2")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_key_pressed(KEY_F) and not ev.echo and get_tree().get_nodes_in_group("3"):
		var hit_note = get_tree().get_nodes_in_group("3")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_key_pressed(KEY_H) and not ev.echo and get_tree().get_nodes_in_group("4"):
		var hit_note = get_tree().get_nodes_in_group("4")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_key_pressed(KEY_J) and not ev.echo and get_tree().get_nodes_in_group("5"):
		var hit_note = get_tree().get_nodes_in_group("5")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_key_pressed(KEY_K) and not ev.echo and get_tree().get_nodes_in_group("6"):
		var hit_note = get_tree().get_nodes_in_group("6")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	if Input.is_key_pressed(KEY_L) and not ev.echo and get_tree().get_nodes_in_group("7"):
		var hit_note = get_tree().get_nodes_in_group("7")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
