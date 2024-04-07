extends Node

var pauseMenu

func _ready():
	pauseMenu = get_node("PauseMenu")
	var resumeButton = get_node("PauseMenu/ResumeButton")
	resumeButton.pressed.connect(_on_resume_button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("pause")):
		var paused = get_node("/root").get_child(0).get_tree().paused
		pauseMenu.visible = !paused
		get_node("/root").get_child(0).get_tree().paused = !paused

		


func _on_resume_button_pressed():
	get_node("/root").get_child(0).get_tree().paused = false
	pauseMenu.visible = false
