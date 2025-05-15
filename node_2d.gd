extends Node2D

var timer = 25

var note = preload("res://Note.tscn")

@onready var notehits = get_node("./Background/NoteHits")
@onready var lane1 = get_node("./Background/LightUp1")
@onready var lane2 = get_node("./Background/LightUp2")
@onready var lane3 = get_node("./Background/LightUp3")
@onready var lane4 = get_node("./Background/LightUp4")
@onready var lanes = [lane1, lane2, lane3, lane4]

var charts = {
	"1ln": "./maps/1ln.csv",
	"donfai": "./maps/donfai.csv",
	"dune": "./maps/dune.csv",
	"end_of_miku": "./maps/end_of_miku.csv",
	"fire_dance": "./maps/fire_dance.csv",
	"mcls": "./maps/mcls.csv",
	"miku": "./maps/miku.csv",
	"smile_symphony": "./maps/smile_symphony.csv"
}

var frame = 10
var map = _open_file(charts[G.songlist[G.Current_Song]])
var notes = {}
#void set_stream(value: AudioStream)
#AudioStream get_stream()

func note_eval(note, p):
	if (p < 795) or (p > 995):
		notehits.notes["bad"] += 1
		G.combo = 0
		if G.life >= 50:
			G.life -= 50
		else:
			G.life = 0
			
	elif (p > 795 and p < 845) or (p > 955 and p < 995):
		notehits.notes["good"] += 1
		G.combo = 0
	elif (p > 845 and p < 875) or (p > 925 and p < 955):
		notehits.notes["great"] += 1
		G.combo += 1
	elif (p > 875 and p < 925):
		notehits.notes["perfect"] += 1
		G.combo += 1
	note.free()

func _ready() -> void:
	$Audio.stream = load(G.Audios[G.Current_Song])
	await get_tree().create_timer(2.0).timeout
	$Audio.play()
	
	print(map)
	map.pop_at(len(map) - 1)
	for note in map:
		print(note)
		if str(note[0]) not in notes.keys():
			notes[note[0]] = [note[1]]
		else:
			notes[note[0]].append(note[1])
	print(notes)
	
	
	
func _create_note(lane):
	print(typeof(note))
	var created_note = note.instantiate(lane)
	add_child(created_note)
	created_note._assign_lane(lane)

@warning_ignore("unused_parameter")
func _process(dt: float):
	frame += 1
	
	if str(frame) in notes.keys():
		for note in notes[str(frame)]:
			_create_note(int(note))
		
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
