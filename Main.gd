extends Node

@onready var space_count: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self._test()

func _test():
	if(Input.is_action_just_pressed("space")):
		space_count += 1
		print(space_count)
