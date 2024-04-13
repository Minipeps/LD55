extends Node3D

var originalPosition : Vector3
var isSnapped : bool = false
var isPlayerOnTop = false

func _ready():
	originalPosition = position
	
func _process(delta):
	print(isPlayerOnTop)

func snap(direction):
	if(!isSnapped && !isPlayerOnTop):
		position = originalPosition + direction
		isSnapped = true
		$SnapDuration.start()
	
func _on_snap_duration_timeout():
	isSnapped = false
	position = originalPosition

func _on_player_area_detector_right_body_entered(body):
	snap(Vector3(-1,0,0))

func _on_player_area_detector_left_body_entered(body):
	snap(Vector3(1,0,0))

func _on_player_area_detector_top_body_entered(body):
	isPlayerOnTop = true

func _on_player_area_detector_top_body_exited(body):
	isPlayerOnTop = false
