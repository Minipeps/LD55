extends Node3D

# Common properties
var is_active: bool = true

var speed: float = 1

var direction = Vector3(1, 0, 0)

# time in ms before the platform gets mad
var counter: float = 0

var isMad: bool = false

var mesh: CSGPrimitive3D = null


# Common methods
func activate():
	is_active = true

func deactivate():
	is_active = false

func countDown(delta):
	if(self.isMad): return # if already mad, doesn't need to countdown
	
	counter -= delta
	if(counter <= 0):
		getMad()

func move(delta):
	if(is_active):
		self.pos += direction * speed * delta

func getMad():
	self.isMad = true
