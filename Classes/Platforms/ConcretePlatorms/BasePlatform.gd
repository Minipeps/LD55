extends "../AbstractPlatform.gd"

class_name BasePlatform


func _init(input_position = Vector3(), counter = 0):
	position = input_position
	self.counter = counter

func _ready():
	self.mesh = CSGBox3D.new()
	self.mesh.transform.origin = position
	add_child(self.mesh)

func getMad():
	super.getMad()
	self.speed *= 4
