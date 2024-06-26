extends "res://Classes/Platforms/AbstractPlatform.gd"

class_name FirePlatform

@onready var idleTimer: Timer = $IdleTimer
@onready var angryTimer: Timer = $AngryTimer
@onready var fireTimer: Timer = $FireTimer

@onready var angrySound: AudioStreamPlayer3D = $angry
@onready var fireSound: AudioStreamPlayer3D = $fire

var timers: Array = [2, 2, 1]
var timersMem: Array = [2, 2, 1] #memorize original times to reset 'timers' array
var timerIndex = 0

var isLethal: bool = false
var playerOnPlatform: bool = false

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
	if (playerOnPlatform && isLethal):
		player.health -= 1
		
func _definePlatformState(timerIndex):
	if(timerIndex == 0):
		angrySound.play()
		animatedSprite.play("angry")
	elif(timerIndex == 1):
		isLethal = true
		angrySound.stop()
		fireSound.play()
		animatedSprite.play("fire")
	elif(timerIndex == 2):
		fireSound.stop()
		# angrySound.play()
		isLethal = false
		animatedSprite.play("angry")


func _on_area_3d_body_entered(body):
	if(body.name == "Logic"):
		playerOnPlatform = true

func _on_area_3d_body_exited(body):
	if(body.name == "Logic"):
		playerOnPlatform = false
