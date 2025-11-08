extends RichTextLabel

var lastX = 0

func update_size():
	remove_theme_font_size_override("normal_font_size")
	add_theme_font_size_override("normal_font_size", DisplayServer.window_get_size().x / 64)
	lastX = DisplayServer.window_get_size()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_size()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lastX != DisplayServer.window_get_size():
		update_size()
	pass
