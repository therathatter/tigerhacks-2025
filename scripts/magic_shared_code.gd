extends Node

class GameState:
	var CurrentLevel: int
	var HasWonLevel: bool
	
var State = GameState.new()

class SoundHelpers:
	static func play_async(parent, sound):
		var music = AudioStreamPlayer.new()
		music.set_stream(sound)
		music.volume_db = 1
		music.pitch_scale = 1
		parent.add_child(music)
		music.play()
		await music.finished
		parent.remove_child(music)
