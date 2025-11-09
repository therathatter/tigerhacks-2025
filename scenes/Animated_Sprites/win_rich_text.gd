extends RichTextLabel

var lastX = 0

var messages = [
	"Even the black hole is impressed.",
	"Mission accomplished.",
	"Even the T-rexes are clapping. (in spirit!)",
	"You’ve won. The singularity files a complaint.",
	"Space time gave you a pass - this time.",
	"The dinosaurs live to see another day… thanks to you.",
	"Congratulations. The game didn’t crash this time.",
	"The void ordered you a medal. Digital, of course.",
	"Miracles do happen.",
	"The stars shimmer in awe.",
	"Time pauses in admiration.",
	"Consider yourself lucky that a bug didn't ruin your game.",
	"Luck? Skill? Who cares. You won.",
	"Wormholes wink in approval.",
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
