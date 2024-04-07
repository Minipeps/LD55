extends Node3D
@export var speed:float = 1.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_handlePlayerPosition(delta)
	
func _handlePlayerPosition(delta):
	position += self._computePlayerMove(delta)

func _computePlayerMove(delta) -> Vector3:
	var vertical_input = Input.get_action_strength("player_move_up") - Input.get_action_strength("player_move_down")
	var horizontal_input = Input.get_action_strength("player_move_right") - Input.get_action_strength("player_move_left")
	var moveVector = Vector3(horizontal_input, 0, -vertical_input).normalized() * speed
	return moveVector
	
