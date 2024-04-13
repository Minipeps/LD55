extends "../AbstractPlatform.gd"

class_name BasePlatform


func _init(input_position = Vector3()):
	position = input_position

func _ready():
	self.mesh = CSGBox3D.new()
	self.mesh.transform.origin = position
	add_child(self.mesh)

func _process(delta):
	self.mesh.transform.origin += self.direction * self.speed * delta
