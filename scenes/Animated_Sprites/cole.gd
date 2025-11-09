extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_character_body():
	return $CharacterBody2D
func get_canvas_layer():
	return $CanvasLayer
func get_kick_charge():
	return $CanvasLayer/KickCharge
func show_win(level):
	$CanvasLayer.remove_child(get_kick_charge())
	$CanvasLayer/Win.visible = true
	$CanvasLayer/Win/VBoxContainer/EoButton.nextLevel = level
	
	
func calculate_relative_pos(v):
	return v - $CharacterBody2D/Camera2D.global_position
