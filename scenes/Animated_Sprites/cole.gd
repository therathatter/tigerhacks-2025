extends Node2D

var finishedSpawnAnimation = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AudioStreamPlayer.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
var nextLevel = ""

func get_character_body():
	return $CharacterBody2D
func get_canvas_layer():
	return $CanvasLayer
func get_kick_charge():
	return $CanvasLayer/KickCharge
func show_win(level):
	G.SoundHelpers.play_async(self, G.WIN_SOUND)
	$CanvasLayer.remove_child(get_kick_charge())
	$CanvasLayer/Win/VBoxContainer/RichTextLabel.set_random_text()
	if Input.get_connected_joypads().size() != 0:
		$CanvasLayer/Win/VBoxContainer/NextLevelEoButton.grab_focus()
	$CanvasLayer/Timer.stop(true)
	$CanvasLayer/Win.visible = true
	$AudioStreamPlayer.stop()
	nextLevel = level
func show_lose(level):
	G.SoundHelpers.play_async(self, G.FAIL_SOUND)
	$CanvasLayer.remove_child(get_kick_charge())
	$CanvasLayer/Lose/VBoxContainer/RichTextLabel.set_random_text()
	if Input.get_connected_joypads().size() != 0:
		$CanvasLayer/Lose/VBoxContainer/RetryEoButton.grab_focus()
	$CanvasLayer/Timer.stop(false)
	$AudioStreamPlayer.stop()
	$CanvasLayer/Lose.visible = true
	nextLevel = level
	
func calculate_relative_pos(v):
	return v - $CharacterBody2D/Camera2D.global_position

func _on_retry() -> void:
	G.State.BlockInput = false
	get_tree().reload_current_scene()

func _on_next_level() -> void:
	G.State.BlockInput = false
	get_tree().change_scene_to_packed(nextLevel)

func _on_main_menu_eo_button_pressed() -> void:
	G.State.BlockInput = false
	get_tree().change_scene_to_file(ProjectSettings.globalize_path("res://scenes/title.tscn"))

func _on_skip_button_pressed() -> void:
	G.State.BlockInput = false
	get_tree().change_scene_to_packed(nextLevel)
	pass # Replace with function body.
