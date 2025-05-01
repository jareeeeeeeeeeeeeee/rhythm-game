extends Sprite2D

var lane = randi_range(0,3)

@onready
var notehits = get_node("../Background/NoteHits")

func _init():
	self.position.x = 715 + lane * 150
	self.position.y = -30
	self.add_to_group(str(lane))

func _process(dt: float):
	self.position.y += G.note_speed
	if self.position.y >= 1100:
		notehits.notes["miss"] += 1
		queue_free()
