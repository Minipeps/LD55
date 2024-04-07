extends AudioStreamPlayer

var _current_pos = 0.0
# Called when the node enters the scene tree for the first time.
func pause():
	_current_pos = get_playback_position()
	stop()

func resume():
	play(_current_pos)
