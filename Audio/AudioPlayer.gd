extends AudioStreamPlayer

const backgroundMusic = preload("res://Audio/Ld55.wav")

func playMusic(volume: float):
	if stream == backgroundMusic:
		return
	stream = backgroundMusic
	volume_db = volume
	play()
	
func playMusicLevel(volume: float):
	self.playMusic(volume)
