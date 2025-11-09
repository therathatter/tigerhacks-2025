extends RichTextLabel

var lastX = 0
var time_elapsed = 0
var stopped = false

func update_size():
	remove_theme_font_size_override("normal_font_size")
	add_theme_font_size_override("normal_font_size", DisplayServer.window_get_size().x / 22)
	lastX = DisplayServer.window_get_size()

func stop(g):
	stopped = true
	self.remove_theme_color_override("theme_override_colors/default_color")
	if g:
		self.add_theme_color_override("default_color", Color(0, 0.6, 0, 1))
	else:
		self.add_theme_color_override("default_color", Color(0.6, 0, 0, 1))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_size()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !stopped:
		time_elapsed += delta
	if lastX != DisplayServer.window_get_size():
		update_size()
	var total_milliseconds = int(time_elapsed * 1000.0)
	var minutes = (total_milliseconds / 60000) % 60
	var seconds = (total_milliseconds / 1000) % 60
	var milliseconds = (total_milliseconds % 1000) / 10  # two digits

	self.text = "%02d:%02d:%02d" % [minutes, seconds, milliseconds]
	pass
