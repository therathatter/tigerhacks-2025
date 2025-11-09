extends Node

class GameState:
	var CurrentLevel: int
	var GameBooted: bool
	var BlockInput: bool
	
var State = GameState.new()

const SELECT_SOUND = preload("res://sounds/select.wav")
const HOVER_SOUND = preload("res://sounds/hover.wav")
const JUMP_SOUND = preload("res://sounds/jump.mp3")
const FAIL_SOUND = preload("res://sounds/fail.mp3")
const WIN_SOUND = preload("res://sounds/win.wav")

const LEVELS = [ 
	preload("res://scenes/levels/tutorial_level.tscn"),
	preload("res://scenes/levels/level_1.tscn"),
	preload("res://scenes/levels/level_2.tscn"),
	preload("res://scenes/levels/level_3.tscn"),
	preload("res://scenes/levels/level_4.tscn")  
]


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
