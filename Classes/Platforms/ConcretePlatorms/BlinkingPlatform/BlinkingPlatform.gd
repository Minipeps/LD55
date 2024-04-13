extends "res://Classes/Platforms/AbstractPlatform.gd"

class_name BlinkingPlatform

var blinkingFrq: float = 0.5
var remainingBlinkingTime: float

func _init(input_position = Vector3(), counter = 0):
	self.speed = 0
	position = input_position
	self.counter = counter
	self.remainingBlinkingTime = blinkingFrq


func _ready():
	self.mesh = CSGBox3D.new()
	self.mesh.use_collision = true
	self.mesh.transform.origin = position
	add_child(self.mesh)

func _process(delta):
	self._blinking(delta)

func _blinking(delta):
	if remainingBlinkingTime <= 0:
		remainingBlinkingTime = blinkingFrq
		self._togglePlatform(!self.isActive)
	else:
		remainingBlinkingTime -= delta

func _togglePlatform(isActive: bool):
	self.isActive = isActive
	self.mesh.visible = isActive
	self.mesh.use_collision = isActive


func _on_area_3d_body_entered(body):
	pass # Replace with function body.
