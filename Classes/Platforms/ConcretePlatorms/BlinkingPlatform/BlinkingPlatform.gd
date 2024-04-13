extends "res://Classes/Platforms/AbstractPlatform.gd"

class_name BlinkingPlatform

@onready var timer: Timer = $Timer

@export var blinkingFrq: float = 0.5
var remainingBlinkingTime: float

@onready var animatedSprite: Node = $AnimatedSprite3D
@onready var staticBody: StaticBody3D = $StaticBody3D

func _init():
	speed = 0

func _ready():
	timer.wait_time = blinkingFrq
	timer.timeout.connect(_togglePlatform)
	animatedSprite.play("neutral")

func getMad():
	super.getMad()
	animatedSprite.play("mad")
	timer.start()

func _togglePlatform():
	isActive = !isActive
	animatedSprite.modulate = Color(1,1,1, isActive)
	if isActive:
		staticBody.process_mode = Node.PROCESS_MODE_ALWAYS
	else:
		staticBody.process_mode = Node.PROCESS_MODE_DISABLED
