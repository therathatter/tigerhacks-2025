extends Node

class GameState:
	var CurrentLevel: int
	var HasWonLevel: bool
	var GameBooted: bool
	
var State = GameState.new()

const SELECT_SOUND = preload("res://sounds/select.wav")
const HOVER_SOUND = preload("res://sounds/hover.wav")
const JUMP_SOUND = preload("res://sounds/jump.mp3")

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
