extends "res://Classes/Platforms/AbstractPlatform.gd"

class_name FirePlatform

@onready var idleTimer: Timer = $IdleTimer
@onready var angryTimer: Timer = $AngryTimer
@onready var fireTimer: Timer = $FireTimer

var timers: Array = [2, 2, 0.5]
var timersMem: Array = [2, 2, 0.5] #memorize original times to reset 'timers' array
var timerIndex = 0

var isLethal: bool = false

@onready var animatedSprite: Node = $AnimatedSprite3D
@onready var staticBody: StaticBody3D = $StaticBody3D

func _init():
	speed = 0

func _ready():
	animatedSprite.play("idle")

func _process(delta):
	timers[timerIndex] -= delta
	if(timers[timerIndex] <= 0):
		self._definePlatformState(timerIndex)
		timers[timerIndex] = timersMem[timerIndex]
		timerIndex+=1
		if(timerIndex >= timers.size()):
			timerIndex = 1
		
func _definePlatformState(timerIndex):
	if(timerIndex == 0):
		animatedSprite.play("angry")
	elif(timerIndex == 1):
		isLethal = true
		animatedSprite.play("fire")
	elif(timerIndex == 2):
		isLethal = false
		animatedSprite.play("angry")


func _on_area_3d_body_entered(body):
	print(isLethal)
	if(body.name == "Logic" && isLethal):
		body.health -= 1
		print("kill player")
