extends Sprite2D

func _process(delta: float):
	self.scale.x = (G.life)/160
	self.position.x = 1480 + (self.scale.x*self.texture.get_width())/2
