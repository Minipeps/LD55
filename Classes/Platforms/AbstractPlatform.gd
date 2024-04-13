extends Node3D

# Common properties
var isActive: bool = true

var speed: float = 1

var direction = Vector3(1, 0, 0)

# time in ms before the platform gets mad
var counter: float = 0

var isMad: bool = false
@onready  var mesh = $mesh

func _process(delta):
	self.countDown(delta)
	self.move(delta)


func activate():
	isActive = true

func deactivate():
	isActive = false

func countDown(delta):
	if(self.isMad): return
	
	counter -= delta
	if(counter <= 0):
		getMad()

func move(delta):
	if(isActive):
		self.mesh.transform.origin += self.direction * self.speed * delta

func getMad():
	print("I'm mad!")
	self.isMad = true
