extends Sprite2D

@export_range(1,100)
var speed = 10
var lane = randi_range(0,3)

@onready
var label = get_node("../Background/NoteHits")

func _init():
	self.position.x = 715 + lane * 150
	self.position.y = -30
	self.add_to_group(str(lane))

func _process(dt: float):
	self.position.y += speed
	if self.position.y >= 1100:
		label.notes["miss"] += 1
		queue_free()
