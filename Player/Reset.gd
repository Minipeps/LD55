extends TextureRect

func _process(_delta):
	if (Input.is_action_just_pressed("reset")):
		get_tree().reload_current_scene()
