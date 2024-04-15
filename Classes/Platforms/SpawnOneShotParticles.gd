extends Node3D

@onready var particle = $GPUParticles3D
var hasJustSpawned = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(hasJustSpawned):
		particle.restart()
		particle.emitting = true
		hasJustSpawned = false


func _on_gpu_particles_3d_finished():
	queue_free()
