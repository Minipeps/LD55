extends Node

@onready var pauseMenu = $PauseMenu
@onready var resumeButton = $PauseMenu/ResumeButton
@onready var quitButton = $PauseMenu/QuitButton
@onready var restartButton = $PauseMenu/RestartButton

func _ready():
	self._initialization()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self._inputsHandler()

func _initialization():
	resumeButton.pressed.connect(self._onResumeButtonPressed) #event needs to dbe connected that way because resumeButton is in another node
	quitButton.pressed.connect(self._onQuitButtonPressed)
	restartButton.pressed.connect(self._onRestartButtonPressed)

func _inputsHandler():
	self._handlePauseInput()

func _handlePauseInput():	
	if(Input.is_action_just_pressed("pause")):
		if(Main.getCurrentGameMode() == Main.GAME_MODE.IN_LEVEL_LOST || Main.getCurrentGameMode() == Main.GAME_MODE.IN_LEVEL_WIN):
			return
		
		var paused = get_node("/root").get_child(0).get_tree().paused
		pauseMenu.visible = !paused

		get_node("/root").get_child(0).get_tree().paused = !paused
		Main.setInLevelPauseGameMode(paused)

func _onResumeButtonPressed():
	get_node("/root").get_child(0).get_tree().paused = false
	pauseMenu.visible = false

func _onQuitButtonPressed():
	get_tree().quit()

func _onRestartButtonPressed():
	get_node("/root").get_child(0).get_tree().paused = false
	get_tree().reload_current_scene()
