
extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if G.State.GameBooted:
		G.SoundHelpers.play_async(self, G.SELECT_SOUND)
	G.State.GameBooted = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
