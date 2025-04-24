extends RigidBody2D

@export_range(1,100)
var speed = 2

func _process(delta: float):
	self.position.y += speed
