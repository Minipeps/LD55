extends Node3D

@export var nextSceneFile : String
@onready var sound = $AudioStreamPlayer3D
@onready var light = $SpotLight3D

func _on_area_3d_body_entered(body):
	if body.is_in_group("Player") && !nextSceneFile.is_empty():
		sound.play()
		light.light_energy = 5
		body.isTeleporting = true
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file(nextSceneFile)
