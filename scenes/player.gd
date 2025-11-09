extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if calculate_relative_pos(self.position).y < -2000:
		get_tree().reload_current_scene()

func get_character_body():
	return $Cole.get_character_body()
	
func get_canvas_layer():
	return $Cole.get_canvas_layer()
	
func get_kick_charge():
	return $Cole.get_kick_charge()
	
func show_win(level):
	G.State.HasWonLevel = true
	return $Cole.show_win(level)
	
func calculate_relative_pos(v):
	return $Cole.calculate_relative_pos(v)
