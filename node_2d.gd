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

func note_eval(note, p):
	if (p < 775) or (p > 1015):
		notehits.notes["bad"] += 1
		G.combo = 0
	elif (p > 775 and p < 835) or (p > 965 and p < 1015):
		notehits.notes["good"] += 1
		G.combo = 0
	elif (p > 835 and p < 875) or (p > 925 and p < 965):
		notehits.notes["great"] += 1
		G.combo += 1
	elif (p > 875 and p < 925):
		notehits.notes["perfect"] += 1
		G.combo += 1
	note.free()

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
	if Input.is_action_just_pressed("button1") and not ev.echo:
		lane1.modulate.a = 1
		if get_tree().get_nodes_in_group("0"):
			var hit_note = get_tree().get_nodes_in_group("0")[0]
			if hit_note.position.y > 695:
				note_eval(hit_note, hit_note.position.y)
	if Input.is_action_just_pressed("button2") and not ev.echo:
		lane2.modulate.a = 1
		if get_tree().get_nodes_in_group("1"):
			var hit_note = get_tree().get_nodes_in_group("1")[0]
			if hit_note.position.y > 695:
				note_eval(hit_note, hit_note.position.y)
	if Input.is_action_just_pressed("button3") and not ev.echo:
		lane3.modulate.a = 1
		if get_tree().get_nodes_in_group("2"):
			var hit_note = get_tree().get_nodes_in_group("2")[0]
			if hit_note.position.y > 695:
				note_eval(hit_note, hit_note.position.y)
	if Input.is_action_just_pressed("button4") and not ev.echo:
		lane4.modulate.a = 1
		if get_tree().get_nodes_in_group("3"):
			var hit_note = get_tree().get_nodes_in_group("3")[0]
			if hit_note.position.y > 695:
				note_eval(hit_note, hit_note.position.y)
	
func _open_file(file):
	var f = FileAccess.open(file, FileAccess.READ)
	var content = []
	while not f.eof_reached():
		content.append(f.get_csv_line())
	return content
