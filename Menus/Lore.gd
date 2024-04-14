extends Control

@onready var lore = $LoreText
@onready var howto = $HowTo
@onready var nextButton = $NextButton
@onready var previousButton = $PreviousButton

signal loreRead

# Called when the node enters the scene tree for the first time.
func _ready():
	nextButton.pressed.connect(clickNext)
	previousButton.pressed.connect(clickPrevious)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		clickNext()

func clickNext():
	if (!howto.visible):
		previousButton.visible = true
		lore.visible = false
		howto.visible = true
	else:
		loreRead.emit()
		visible = false

func clickPrevious():
	nextButton.visible = true
	previousButton.visible = false
	lore.visible = true
	howto.visible = false
