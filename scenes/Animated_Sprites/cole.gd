extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	$CanvasLayer/Win/VBoxContainer/EoButton.grab_focus()
	$CanvasLayer/Win.visible = true
	nextLevel = level
func show_lose():
	G.SoundHelpers.play_async(self, G.FAIL_SOUND)
	$CanvasLayer.remove_child(get_kick_charge())
	$CanvasLayer/Lose/VBoxContainer/RichTextLabel.set_random_text()
	$CanvasLayer/Lose/VBoxContainer/EoButton.grab_focus()
	$CanvasLayer/Lose.visible = true
	
func calculate_relative_pos(v):
	return v - $CharacterBody2D/Camera2D.global_position

func _on_retry() -> void:
	get_tree().reload_current_scene()
	G.State.BlockInput = false

func _on_next_level() -> void:
	get_tree().change_scene_to_file(nextLevel)
	G.State.BlockInput = false
	pass # Replace with function body.
