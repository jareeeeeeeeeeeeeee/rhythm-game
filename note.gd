extends RigidBody2D

@export_range(1,100)
var speed = 10

func _init():
	self.position.x = 415 + randi_range(0,7) * 150

func _process(delta: float):
	self.position.y += speed
