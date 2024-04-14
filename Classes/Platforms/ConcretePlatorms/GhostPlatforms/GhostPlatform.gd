extends Node3D

@onready var canSpawnColor = Color(0,1,0,1)
@onready var cannotSpawnColor = Color(1,0,0,1)
var canSpawn = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	canSpawn = !($Area3D.has_overlapping_bodies())
	if canSpawn:
		$MeshInstance3D.mesh.material.emission = canSpawnColor
	else:
		$MeshInstance3D.mesh.material.emission = cannotSpawnColor

func setWidth(width):
	$MeshInstance3D.scale.x = width
	$Area3D/CollisionShape3D.shape.size.x = width
	

