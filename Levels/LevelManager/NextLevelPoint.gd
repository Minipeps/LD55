extends Node3D

@export var nextSceneFile : String

func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file(nextSceneFile)
