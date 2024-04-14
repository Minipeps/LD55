extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 8
const PLATFORM_RANGE = 5
var dropPlane  = Plane(Vector3(0, 0, 1), Vector3.AXIS_Z)
var previousVelocity = Vector3(0,0,0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var camera = $Camera3D
@onready var spherePivot = $SpherePivot
@onready var inventory = $Inventory
@onready var cursor = $Cursor

@onready var visual = $Visual
var health: int = 1;
var isAlive: bool = true
var isSwitchingSpell: int = 0
var isCasting: int = 0

signal create_platform(type: int, position: Vector3)
signal death_player()

func _process(_delta):
	if(!isAlive):
		return
	# Handle platform spawning action
	if Input.is_action_just_pressed("spawn_platform") && $SpherePivot/GhostPlatform.canSpawn:
		if inventory.useSelectedItem():
			isCasting = 10
			create_platform.emit(inventory.selectedItem, spherePivot.global_position)

func _physics_process(delta):
	if(!isAlive):
		return
	previousVelocity = velocity
	# Add the gravity.
	if not is_on_floor():
		var amount = gravity * delta
		if velocity.y < 0:
			amount *= 2
		velocity.y -= amount

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("player_move_left", "player_move_right", "player_move_up", "player_move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	_handleCursorPosition()
	_handleAnimation()
	_checkHealth()
	

func _checkHealth():
	if(health <= 0):
		death_player.emit()
		isAlive = false
		visual.play("death")

func _handleAnimation():
	var changeDirection = (!visual.flip_h && velocity.x < 0) || (visual.flip_h && velocity.x > 0)
	if(changeDirection):
		visual.flip_h = !visual.flip_h
	if (isCasting > 0):
		visual.play("cast")
		isCasting -= 1
		return
	if (isSwitchingSpell > 0):
		visual.play("search")
		isSwitchingSpell -= 1
		return
	if(velocity.y < 0):
		visual.play("jump_fall")
		return
	if(velocity.y > 0):
		visual.play("jump_rise")
		return
	if(velocity.x != 0 ):
		visual.play("walk")
		return
	visual.play('idle')


func _handleCursorPosition():
	var position2D = get_viewport().get_mouse_position()
	var position3D = dropPlane.intersects_ray(camera.project_ray_origin(position2D), camera.project_ray_normal(position2D))
	var directionVector = position3D - global_position
	var currentVectorLength = directionVector.length()
	var finalVectorLength = min(PLATFORM_RANGE, currentVectorLength)
	var finalVector = directionVector.normalized() * finalVectorLength
	finalVector.z = 0
	spherePivot.global_position = global_position + finalVector
	cursor.global_position = global_position + finalVector * 0.5
	cursor.rotation.z = atan2(finalVector.y, finalVector.x)


func _on_actual_death_area_body_entered(body):
	if(body.name == "Logic"):
		health = 0


func _on_inventory_on_item_changed(newPlatformType):
	var width = $Inventory.getWidthSelectedItem(newPlatformType)
	$SpherePivot/GhostPlatform.setWidth(width)
	isSwitchingSpell = 10
