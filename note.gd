extends Sprite2D

@export_range(1,100)
var speed = 10

func _init():
	self.position.x = 415 + randi_range(0,7) * 150
	self.position.y = -30

func _process(delta: float):
	self.position.y += speed
