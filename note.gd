extends Sprite2D

var lane
@onready
var notehits = get_node("../Background/NoteHits")

func _init():
	pass
	
func _assign_lane(lane):
	self.lane = lane
	self.add_to_group(str(lane))
	self.position.x = 715 + lane * 150
	self.position.y = -30
	

func _process(dt: float):
		self.position.y += G.note_speed
		if self.position.y >= 1100:
			notehits.notes["miss"] += 1
			queue_free()
