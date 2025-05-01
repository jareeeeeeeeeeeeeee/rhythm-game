extends Node2D

var timer = 25

var note_preload = preload("Note.tscn")



@onready var label = get_node("./Background/Label")
@onready var lane1 = get_node("./Background/LightUp1")
@onready var lane2 = get_node("./Background/LightUp2")
@onready var lane3 = get_node("./Background/LightUp3")
@onready var lane4 = get_node("./Background/LightUp4")
@onready var lanes = [lane1, lane2, lane3, lane4]

#void set_stream(value: AudioStream)
#AudioStream get_stream()


func _process(dt: float):
	timer -= 1
	if timer == 0:
		timer = 25
		var note = note_preload.instantiate()
		add_child(note)
	
	for lane in lanes:
		if lane.modulate.a > 0:
			lane.modulate.a -= 0.1

func _input(ev):
	if Input.is_action_just_pressed("button1") and not ev.echo and get_tree().get_nodes_in_group("0"):
		var hit_note = get_tree().get_nodes_in_group("0")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	elif Input.is_action_just_pressed("button1") and not ev.echo and not get_tree().get_nodes_in_group("0"):
		lane1.modulate.a = 1
	if Input.is_action_just_pressed("button2") and not ev.echo and get_tree().get_nodes_in_group("1"):
		var hit_note = get_tree().get_nodes_in_group("1")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	elif Input.is_action_just_pressed("button2") and not ev.echo and not get_tree().get_nodes_in_group("1"):
		lane2.modulate.a = 1
	if Input.is_action_just_pressed("button3") and not ev.echo and get_tree().get_nodes_in_group("2"):
		var hit_note = get_tree().get_nodes_in_group("2")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	elif Input.is_action_just_pressed("button3") and not ev.echo and not get_tree().get_nodes_in_group("2"):
		lane3.modulate.a = 1
	if Input.is_action_just_pressed("button4") and not ev.echo and get_tree().get_nodes_in_group("3"):
		var hit_note = get_tree().get_nodes_in_group("3")[0]
		print(hit_note.position.y)
		hit_note.queue_free()
	elif Input.is_action_just_pressed("button4") and not ev.echo and not get_tree().get_nodes_in_group("3"):
		lane4.modulate.a = 1
