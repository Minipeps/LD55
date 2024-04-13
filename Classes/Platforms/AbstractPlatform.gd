extends Node3D

# Common properties
var isActive: bool = true

@export var speed: float = 1

var direction = Vector3(1, 0, 0)

# time in ms before the platform gets mad
@export var counter: float = 0

var isMad: bool = false
@onready  var mesh = $mesh

var player: Node3D

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
	if(isActive && self.mesh):
		self.mesh.transform.origin += self.direction * self.speed * delta

func getMad():
	print("I'm mad!")
	self.isMad = true

func setPlayer(playerNode: Node3D):
	player = playerNode
