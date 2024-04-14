extends Node3D

@onready var canSpawnColor = Color(0,1,0,1)
@onready var cannotSpawnColor = Color(1,0,0,1)
@onready var sprite: Sprite3D = $Sprite3D

var canSpawn = false
var spriteDefaultScale: float

func _ready():
	spriteDefaultScale = sprite.scale.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	canSpawn = !($Area3D.has_overlapping_bodies())
	sprite.modulate = canSpawnColor if canSpawn else cannotSpawnColor

func setWidth(width: float):
	sprite.scale.x = width * spriteDefaultScale
	$Area3D/CollisionShape3D.shape.size.x = width
