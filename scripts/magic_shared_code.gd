extends Node

class GameState:
	var CurrentLevel: int
	var GameBooted: bool
	var BlockInput: bool
	
var State = GameState.new()


var SELECT_SOUND = load(ProjectSettings.globalize_path("res://sounds/select.wav"))
var HOVER_SOUND = load(ProjectSettings.globalize_path("res://sounds/hover.wav"))
var JUMP_SOUND = load(ProjectSettings.globalize_path("res://sounds/jump.mp3"))
var FAIL_SOUND = load(ProjectSettings.globalize_path("res://sounds/fail.mp3"))
var WIN_SOUND = load(ProjectSettings.globalize_path("res://sounds/win.wav"))

var LEVELS = [ 
	load(ProjectSettings.globalize_path("res://scenes/levels/tutorial_level.tscn")),
	load(ProjectSettings.globalize_path("res://scenes/levels/level_1.tscn")),
	load(ProjectSettings.globalize_path("res://scenes/levels/level_2.tscn")),
	load(ProjectSettings.globalize_path("res://scenes/levels/level_3.tscn")),
	load(ProjectSettings.globalize_path("res://scenes/levels/level_4.tscn"))  
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
