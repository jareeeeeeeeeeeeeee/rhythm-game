extends Sprite2D

func _process(delta: float):
	if G.life:
		self.scale.x = (G.life)/160
		self.position.x = 1480 + (self.scale.x*self.texture.get_width())/2
	else:
		self.scale.x = 6.25
		self.position.x = 1680
		self.modulate = Color(1,0,0)
