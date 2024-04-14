extends Node3D

@export var speed: float = 2

@onready var sprite: Sprite3D = $Sprite3D
@onready var deathTimer: Timer = $DeathTimer
@onready var flipTimer: Timer = $FlipTimer

var direction: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	deathTimer.timeout.connect(destroy)
	flipTimer.timeout.connect(flipSprite)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position += direction * speed * delta

func setTarget(target: Vector3):
	direction = (target - global_position).normalized()
	rotate_object_local(Vector3(0,0,1), atan2(direction.y, direction.x))

func destroy():
	queue_free()
	
func flipSprite():
	sprite.flip_h = !sprite.flip_h

func _on_body_entered(body):
	if(body.name == "Logic"):
		body.health -= 1
		destroy()
