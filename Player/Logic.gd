extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const PLATFORM_RANGE = 3
var dropPlane  = Plane(Vector3(0, 0, 1), Vector3.AXIS_Z)
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var camera = $Camera3D
@onready var spherePivot = $SpherePivot

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("player_move_left", "player_move_right", "player_move_up", "player_move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	_handleSpawnSphere()
	
func _handleSpawnSphere():
	var position2D = get_viewport().get_mouse_position()
	var position3D = dropPlane.intersects_ray(camera.project_ray_origin(position2D), camera.project_ray_normal(position2D))
	var directionVector = position3D - global_position
	var currentVectorLength = directionVector.length()
	var finalVectorLength = min(PLATFORM_RANGE, currentVectorLength)
	var finalVector = directionVector.normalized() * finalVectorLength
	finalVector.z = 0
	spherePivot.global_position = global_position + finalVector
	
	
	
