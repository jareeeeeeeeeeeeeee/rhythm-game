extends Button

func _ready():
	var button = Button.new()
	button.text = "Play Selected Song"
	button.pressed.connect(_button_pressed)
	add_child(button)
	
func _button_pressed():
	print("miku miku beam")
