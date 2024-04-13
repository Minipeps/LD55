extends Node3D

@export var speed: float = 2

@onready var lifeTimer: Timer = $Timer

var direction: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	lifeTimer.timeout.connect(destroy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	transform.origin += direction * speed * delta

func setTarget(target: Vector3):
	direction = (target - transform.origin).normalized()

func destroy():
	queue_free()

func _on_body_entered(body):
	if(body.name == "Logic"):
		print("player collision!")
		destroy()
