extends Node3D

var originalPosition : Vector3
var isSnapped : bool = false
var isPlayerOnTop = false

func _ready():
	originalPosition = position

func snap(direction):
	position = originalPosition + direction

func _on_player_area_detector_right_body_entered(body):
	if(!isSnapped && !isPlayerOnTop):
		snap(Vector3(-1,0,0))
		isSnapped = true
		$SnapDuration.start()

func _on_player_area_detector_left_body_entered(body):
	snap(Vector3(1,0,0))
	isSnapped = true
	$SnapDuration.start()

func _on_snap_duration_timeout():
	isSnapped = false
	position = originalPosition
