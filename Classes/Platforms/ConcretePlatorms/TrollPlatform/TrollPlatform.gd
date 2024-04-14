extends "res://Classes/Platforms/AbstractPlatform.gd"

@export var movingDistance = 2

var originalPosition : Vector3
var isSnapped : bool = false
var isPlayerOnTop = false

@onready var animatedSprite: AnimatedSprite3D = $AnimatedSprite3D
@onready var movingTimer: Timer = $MovingTimer

func setOrigin(origin: Vector3):
	originalPosition = origin

func _ready():
	movingTimer.wait_time = movingDistance / speed
	counter = 5 * movingDistance / speed

func _process(delta):
	super._process(delta)
	if isMad: return
	var t = movingTimer.time_left / movingTimer.wait_time
	var moveFactor = cos(2 * PI * t) * movingDistance
	position = originalPosition + direction * moveFactor
	animatedSprite.frame = t > 0.5

func getMad():
	super.getMad()
	position = originalPosition
	animatedSprite.animation = "snapping"

func snap(snapDirection):
	if(!isSnapped && !isPlayerOnTop):
		position = originalPosition + snapDirection * movingDistance
		isSnapped = true
		$SnapDuration.start()

func _on_moving_timer_timeout():
	pass
	# animatedSprite.frame = 2 if animatedSprite.frame == 1 else 1

func _on_snap_duration_timeout():
	isSnapped = false
	position = originalPosition

func _on_player_area_detector_right_body_entered(body):
	if body.name != "Logic": return
	if !isMad: return
	snap(Vector3(-1,0,0))
	animatedSprite.frame = 1

func _on_player_area_detector_left_body_entered(body):
	if body.name != "Logic": return
	if !isMad: return
	snap(Vector3(1,0,0))
	animatedSprite.frame = 0

func _on_player_area_detector_top_body_entered(body):
	if body.name != "Logic": return
	isPlayerOnTop = true

func _on_player_area_detector_top_body_exited(body):
	if body.name != "Logic": return
	isPlayerOnTop = false
