extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	G.SoundHelpers.play_async(self, G.SELECT_SOUND)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
