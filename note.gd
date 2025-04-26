extends Sprite2D

@export_range(1,100)
var speed = 10
var lane = randi_range(0,7)

func _init():
	self.position.x = 415 + lane * 150
	self.position.y = -30
	self.add_to_group(str(lane))

func _process(delta: float):
	self.position.y += speed
	if self.position.y >= 1100:
		queue_free()
