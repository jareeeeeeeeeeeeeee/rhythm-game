extends Node2D



func _ready() -> void:
	for image in DirAccess.get_files_at("res://Songlist/"):
		if str(image).get_slice(".",2) != "import":
			G.Songs.append(ImageTexture.create_from_image(Image.load_from_file("res://Songlist/" + str(image))))
	for song in DirAccess.get_files_at("res://music/"):
		if str(song).get_slice(".",2) != "import":
			G.Audios.append("res://music/" + str(song))

	


func _scrol_left():
	if Input.is_action_just_pressed("Menu Scroll Left"):
		G.Current_Song -= 1
		if G.Current_Song < 0:
			G.Current_Song = len(G.Songs) - 1
		
		
func _scrol_right():
	if Input.is_action_just_pressed("Menu Scroll Right"):
		G.Current_Song += 1
		if G.Current_Song > len(G.Songs) - 1:
			G.Current_Song = 0


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	_scrol_left()
	_scrol_right()
	$Left.texture = G.Songs[G.Current_Song - 1]
	$Selected.texture = G.Songs[G.Current_Song]
	if G.Current_Song < len(G.Songs) - 1:
		$Right.texture = G.Songs[G.Current_Song + 1]
	elif G.Current_Song == len(G.Songs) - 1:
		$Right.texture = G.Songs[0]
	
