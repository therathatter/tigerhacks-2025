extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startSquiggling() -> void:
	var tween := create_tween()
	tween.tween_method(set_shader_value, 0.0, 10.0, 2);

func set_shader_value(value: float):
	self.material.set_shader_parameter("amplitude", value)
