extends Control

@onready var tutorialScene = load("res://Menus/Tutorial/Tutorial.tscn")
@export var testLevel = "res://Levels/TestLevel/TestLevel.tscn"

func onStartButtonPressed():
	get_tree().change_scene_to_file(testLevel)
	print("start button pressed: first scene" + testLevel)	

func onTutorialButtonPressed():
	var tutorialSceneInstance = tutorialScene.instantiate()
	get_tree().current_scene.add_child(tutorialSceneInstance)

func onQuitButtonPressed():
	get_tree().quit()
