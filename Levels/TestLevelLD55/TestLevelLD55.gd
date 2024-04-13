extends Node3D

var BlinkingPlatform = load("res://Classes/Platforms/ConcretePlatorms/BlinkingPlatform.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	self._createPlatform(Vector3(1, 0, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	# Create a BlinkingPlatform
func _createPlatform(platformPosition: Vector3 = Vector3(0, 0, 0)):
	var BlinkingPlatform = BlinkingPlatform.new(platformPosition, 2)
	add_child(BlinkingPlatform)
