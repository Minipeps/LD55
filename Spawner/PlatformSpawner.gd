extends Node3D

const AbstractPlatform = preload("res://Classes/Platforms/AbstractPlatform.gd")

@onready var playerLogic = get_node("../Player/Logic")

var blinkingPlatform = preload("res://Classes/Platforms/ConcretePlatorms/BlinkingPlatform/BlinkingPlatform.tscn")
var trollPlatform = preload("res://Classes/Platforms/ConcretePlatorms/TrollPlatform/TrollPlatform.tscn")
var shootingPlatform = preload("res://Classes/Platforms/ConcretePlatorms/ShootingPlatform/ShootingPlatform.tscn")

var platformTypes = [blinkingPlatform, trollPlatform, shootingPlatform]

func _ready():
	playerLogic.create_platform.connect(spawnPlatform)

func spawnPlatform(platformType: int, platformPosition: Vector3):
	print(platformType)
	var platform = platformTypes[platformType].instantiate()
	add_child(platform)
	platform.transform.origin = platformPosition
	if (platform is AbstractPlatform):
		platform.setPlayer(playerLogic)
