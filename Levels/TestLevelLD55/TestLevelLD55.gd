extends Node3D

var BlinkingPlatform = load("res://Classes/Platforms/ConcretePlatorms/BlinkingPlatform/BlinkingPlatform.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_just_pressed("reset")):
		get_tree().reload_current_scene()
