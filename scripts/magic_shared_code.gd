extends Node

func play_sound_async(parent, sound):
	var music = AudioStreamPlayer.new()
	music.set_stream(sound)
	music.volume_db = 1
	music.pitch_scale = 1
	parent.add_child(music)
	music.play()
	await music.finished
	parent.remove_child(music)
