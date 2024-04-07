extends Control


@onready var tutorialScene = load("res://Menus/tutorial.tscn")


func _on_start_button_pressed():
	var startButton = get_node("VBoxContainer/StartButton")
	print("start button pressed: first scene" + startButton.getFirstScene())
	get_tree().change_scene_to_file(startButton.getFirstScene())


func _on_quit_button_pressed():
	get_tree().quit()


func _on_tutorial_button_pressed():
	var tutorialSceneInstance = tutorialScene.instantiate()
	get_tree().current_scene.add_child(tutorialSceneInstance)
