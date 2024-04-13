extends Node3D

@onready var playerLogic = get_node("../Player/Logic")

var BlinkingPlatform = preload("res://Classes/Platforms/ConcretePlatorms/BlinkingPlatform/BlinkingPlatform.tscn")
var TrollPlatform = preload("res://Classes/Platforms/ConcretePlatorms/TrollPlatform/troll_platform.tscn")

var platformTypes = [BlinkingPlatform, TrollPlatform]

func _ready():
	playerLogic.create_platform.connect(spawnPlatform)

func spawnPlatform(platformType: int, platformPosition: Vector3):
	print(platformType)
	var platform = platformTypes[platformType].instantiate()
	add_child(platform)
	platform.transform.origin = platformPosition
