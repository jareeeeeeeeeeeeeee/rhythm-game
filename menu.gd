extends Node2D

@export
var Current_Song = 1
@export
var Songs = []

func _ready() -> void:
	for image in DirAccess.get_files_at("res://Songlist/"):
		if str(image).get_slice(".",2) != "import":
			Songs.append(ImageTexture.create_from_image(Image.load_from_file("res://Songlist/" + str(image))))
	


func _scrol_left():
	if Input.is_action_just_pressed("Menu Scroll Left"):
		Current_Song -= 1
		if Current_Song < 0:
			Current_Song = len(Songs) - 1
		print("test")
		
func _scrol_right():
	if Input.is_action_just_pressed("Menu Scroll Right"):
		Current_Song += 1
		if Current_Song > len(Songs) - 1:
			Current_Song = 0


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	_scrol_left()
	_scrol_right()
	$Left.texture = Songs[Current_Song - 1]
	$Selected.texture = Songs[Current_Song]
	if Current_Song < len(Songs) - 1:
		$Right.texture = Songs[Current_Song + 1]
	elif Current_Song == len(Songs) - 1:
		$Right.texture = Songs[0]
	
