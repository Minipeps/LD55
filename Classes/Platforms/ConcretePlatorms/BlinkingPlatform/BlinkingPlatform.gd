extends "res://Classes/Platforms/AbstractPlatform.gd"

class_name BlinkingPlatform

@onready var timer: Timer = $Timer
@onready var fadeTimer: Timer = $FadeTimer

@export var blinkingFrq: float = 1.1
var isFading: bool = false

@onready var animatedSprite: Node = $AnimatedSprite3D
@onready var staticBody: StaticBody3D = $StaticBody3D

func _init():
	speed = 0

func _ready():
	timer.wait_time = blinkingFrq
	timer.timeout.connect(_fadePlatform)
	fadeTimer.timeout.connect(_togglePlatform)
	animatedSprite.play("neutral")

func _process(delta):
	super._process(delta)
	if !isFading: return
	var ratio = fadeTimer.time_left/fadeTimer.wait_time
	var alpha = ratio if isActive else 1 - ratio
	animatedSprite.modulate = Color(1,1,1, alpha)

func getMad():
	super.getMad()
	animatedSprite.play("mad")
	timer.start()

func _fadePlatform():
	fadeTimer.start()
	isFading = true

func _togglePlatform():
	isFading = false
	isActive = !isActive
	animatedSprite.modulate = Color(1,1,1, isActive)
	if isActive:
		staticBody.process_mode = Node.PROCESS_MODE_ALWAYS
	else:
		staticBody.process_mode = Node.PROCESS_MODE_DISABLED
