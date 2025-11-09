extends RichTextLabel

var lastX = 0

var messages = [
	"Gravity wins. Again.",
	"Dinosaurs survived meteors. You couldn’t survive basic physics.",
	"Next time, maybe don’t fly directly into the singularity.",
	"Mission failed. Physics remains undefeated.",
	"Turns out mass does matter.",
	"Good effort. Bad trajectory.",
	"You’ve officially orphaned a species.",
	"Even the fossils are shaking their heads.",
	"The eggs believed in you. Briefly.",
    "On the bright side, fossils don’t hold grudges."
]

func set_random_text():
	self.text = messages.pick_random()

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
