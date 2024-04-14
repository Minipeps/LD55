extends Node
@export var mainMenu = "res://Menus/MainMenu.tscn"

const winText = "c'est gagner!"
const loseText = "c'est perdut :("

# Called when the node enters the scene tree for the first time.
func _ready():
	return
	if(Main.getCurrentGameMode() == Main.GAME_MODE.IN_LEVEL_WIN): 
		self._showWinScreen()
	else: 
		self._showLoseScreen()
	
func _showWinScreen():
	%Label.text = winText
	
func _showLoseScreen():
	%Label.text = loseText
	
func onReloadGameSceneButtonPressed():
	get_tree().reload_current_scene()

func onQuitButtonPressed():
	get_tree().quit()

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file(mainMenu)
