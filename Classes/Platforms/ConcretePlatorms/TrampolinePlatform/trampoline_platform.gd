extends Node3D

@export var maxBounce : int = 3
@export var bounceVelocity : float = 13

var bounceCount : int

@onready var animatedSprite: AnimatedSprite3D = $AnimatedSprite3D
@onready var sound1 =  $Sounds/Sound1
@onready var sound2 =  $Sounds/Sound2
@onready var sound3 =  $Sounds/Sound3

func _ready():
	bounceCount = maxBounce
	_updateSprite(0)

func _on_player_area_detector_top_body_entered(body):
	if(bounceCount > 0):
		var bounceAddVelocity : float = 0
		match bounceCount:
			3:
				sound1.play()
				bounceAddVelocity = bounceVelocity / 1.5
				
			2:
				sound2.play()
				bounceAddVelocity = bounceVelocity / 1.2
			1:
				sound2.volume_db += 2
				sound3.play()
				sound2.volume_db -= 2
				bounceAddVelocity = bounceVelocity
		body.velocity.y = bounceAddVelocity
		bounceCount -= 1
	else:
		sound3.play()
		body.health -= 1
	_updateSprite(maxBounce - bounceCount)

func _updateSprite(index):
	animatedSprite.frame = index
