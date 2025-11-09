extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_character_body():
	return $Cole.get_character_body()
func get_canvas_layer():
	return $Cole.get_canvas_layer()
func get_kick_charge():
	return $Cole.get_kick_charge()
