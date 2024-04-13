extends Node3D

@export var maxBounce : int = 3
@export var bounceVelocity : float = 10

var bounceCount : int

func _ready():
	bounceCount = maxBounce

func _on_player_area_detector_top_body_entered(body):
	if(bounceCount > 0):
		var bounceAddVelocity : float = 0
		match bounceCount:
			3:
				bounceAddVelocity = bounceVelocity / 2.0
			2:
				bounceAddVelocity = bounceVelocity / 1.5
			1:
				bounceAddVelocity = bounceVelocity
		body.velocity.y = bounceAddVelocity
		bounceCount -= 1
	else:
		print("kill player")
