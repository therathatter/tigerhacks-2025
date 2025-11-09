extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_button_focus_entered() -> void:
	G.SoundHelpers.play_async(G, G.HOVER_SOUND)
	pass # Replace with function body.


func _on_back_button_pressed() -> void:
	G.SoundHelpers.play_async(G, G.SELECT_SOUND)
	pass # Replace with function body.
