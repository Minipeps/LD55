extends "res://Classes/Platforms/AbstractPlatform.gd"

@onready var shootTimer: Timer = $ShootTimer

@onready var player: Node = get_node("../Player/Logic")

var bulletPrefab = preload("res://Classes/Bullet.tscn")

func _init():
	speed = 0

func _ready():
	add_child(self.mesh)
	shootTimer.timeout.connect(shoot)
 
func getMad():
	super.getMad()
	shootTimer.start()

func shoot():
	# Shoot bullet towards the player
	var bullet = bulletPrefab.instantiate()
	bullet.setTarget(player.transform.origin)
	add_child(bullet)
