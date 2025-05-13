extends Node2D

var timer = 25

var note = preload("res://Note.tscn")

@onready var notehits = get_node("./Background/NoteHits")
@onready var lane1 = get_node("./Background/LightUp1")
@onready var lane2 = get_node("./Background/LightUp2")
@onready var lane3 = get_node("./Background/LightUp3")
@onready var lane4 = get_node("./Background/LightUp4")
@onready var lanes = [lane1, lane2, lane3, lane4]

var chart = "res://maps/fire_dance.csv"

var current_note = 0
var frame = 0
var map = _open_file(chart)
#void set_stream(value: AudioStream)
#AudioStream get_stream()

func note_eval(p):
	if (p < 935) or (p > 1265):
		notehits.notes["bad"] += 1
		G.combo = 0
	elif (p > 935 and p < 995) or (p > 1205 and p < 1265):
		notehits.notes["good"] += 1
		G.combo = 0
	elif (p > 995 and p < 1045) or (p > 1155 and p < 1205):
		notehits.notes["great"] += 1
		G.combo += 1
	elif (p > 1045 and p < 1155):
		notehits.notes["perfect"] += 1
		G.combo += 1
	print(p)

func _ready() -> void:
	$Audio.stream = load(G.Audios[G.Current_Song])
	$Audio.play()
	
	print(map)
	
	
func _create_note(lane):
	print(typeof(note))
	var created_note = note.instantiate(lane)
	add_child(created_note)
	created_note._assign_lane(lane)

@warning_ignore("unused_parameter")
func _process(dt: float):
	frame += 1
	if frame == int(map[current_note][0]):
		_create_note(int(map[current_note][1]))
		current_note += 1
		
	for lane in lanes:
		if lane.modulate.a > 0:
			lane.modulate.a -= 0.1

func _input(ev):
	if Input.is_action_just_pressed("button1") and not ev.echo and get_tree().get_nodes_in_group("0"):
		var hit_note = get_tree().get_nodes_in_group("0")[0]
		if hit_note.position.y > 650:
			note_eval(hit_note.position.y)
			hit_note.free()
		lane1.modulate.a = 1
	elif Input.is_action_just_pressed("button1") and not ev.echo and not get_tree().get_nodes_in_group("0"):
		lane1.modulate.a = 1
	if Input.is_action_just_pressed("button2") and not ev.echo and get_tree().get_nodes_in_group("1"):
		var hit_note = get_tree().get_nodes_in_group("1")[0]
		if hit_note.position.y > 650:
			note_eval(hit_note.position.y)
			hit_note.free()
		lane2.modulate.a = 1
	elif Input.is_action_just_pressed("button2") and not ev.echo and not get_tree().get_nodes_in_group("1"):
		lane2.modulate.a = 1
	if Input.is_action_just_pressed("button3") and not ev.echo and get_tree().get_nodes_in_group("2"):
		var hit_note = get_tree().get_nodes_in_group("2")[0]
		if hit_note.position.y > 650:
			note_eval(hit_note.position.y)
			hit_note.free()
		lane3.modulate.a = 1
	elif Input.is_action_just_pressed("button3") and not ev.echo and not get_tree().get_nodes_in_group("2"):
		lane3.modulate.a = 1
	if Input.is_action_just_pressed("button4") and not ev.echo and get_tree().get_nodes_in_group("3"):
		var hit_note = get_tree().get_nodes_in_group("3")[0]
		if hit_note.position.y > 650:
			note_eval(hit_note.position.y)
			hit_note.free()
		lane4.modulate.a = 1
	elif Input.is_action_just_pressed("button4") and not ev.echo and not get_tree().get_nodes_in_group("3"):
		lane4.modulate.a = 1

func _open_file(file):
	var f = FileAccess.open(file, FileAccess.READ)
	var content = []
	while not f.eof_reached():
		content.append(f.get_csv_line())
	return content
