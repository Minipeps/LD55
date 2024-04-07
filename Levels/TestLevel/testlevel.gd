extends Node3D

@onready var popossum:MeshInstance3D  = get_node("Popossum")
@onready var pauseMenu  = load("res://Menus/PauseMenu.tscn")

@export var speed: float = 45

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	# popossum.rotation_degrees.y += speed * delta
