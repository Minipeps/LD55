extends Control

@onready var tutorialScene = load("res://Menus/Tutorial.tscn")

func _ready():
	BackgroundMusicPlayer.playMusicLevel(1)

func onStartButtonPressed():
	var startButton = get_node("VBoxContainer/StartButton")
	print("start button pressed: first scene" + startButton.getFirstScene())
	get_tree().change_scene_to_file(startButton.getFirstScene())

func onTutorialButtonPressed():
	var tutorialSceneInstance = tutorialScene.instantiate()
	get_tree().current_scene.add_child(tutorialSceneInstance)

func onQuitButtonPressed():
	get_tree().quit()
