extends Node3D

var BasePlatform = load("res://Classes/Platforms/ConcretePlatorms/BasePlatform.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	self._createBasePlatform(Vector3(1, 3, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	# Create a BasePlatform
func _createBasePlatform(platformPosition: Vector3 = Vector3(0, 0, 0)):
	print("Creating Base Platform")
	var basePlatform = BasePlatform.new(platformPosition)
	add_child(basePlatform)
