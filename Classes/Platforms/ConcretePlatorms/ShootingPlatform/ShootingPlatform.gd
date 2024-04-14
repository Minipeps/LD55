extends "res://Classes/Platforms/AbstractPlatform.gd"

@onready var shootTimer: Timer = $ShootTimer
@onready var animatedSprite: AnimatedSprite3D = $AnimatedSprite3D

var bulletPrefab = preload("res://Classes/Bullet.tscn")

func _init():
	speed = 0

func _ready():
	shootTimer.timeout.connect(shoot)
	animatedSprite.play("default")
 
func getMad():
	super.getMad()
	shootTimer.start()

func shoot():
	animatedSprite.play("shoot")
	# Shoot bullet towards the player
	var bullet = bulletPrefab.instantiate()
	add_child(bullet)
	bullet.setTarget(player.global_position)

func _on_animated_sprite_3d_animation_looped():
	if !isMad: return
	animatedSprite.play("mad")
