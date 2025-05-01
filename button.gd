extends Button

func _ready():
	var button = Button.new()
	button.text = "Play Selected Song"
	button.pressed.connect(_button_pressed)
	add_child(button)
	
func _button_pressed():
	get_tree().change_scene_to_file("res://node_2d.tscn")
	print(G.Songs[G.Current_Song])
