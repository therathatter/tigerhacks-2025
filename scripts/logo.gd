extends HBoxContainer

var speed = 2.0
var direction = 0 # 0 = rotate positively, 1 = rotate negatively

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# self.pivot_offset = self.size / 2
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if direction == 0:
		self.rotation_degrees += speed * delta	
	else:
		self.rotation_degrees -= speed * delta
	
	if self.rotation_degrees > 4.0:
		# self.pivot_offset.x = randf_range(0.0, 25.0)
		direction = 1
	elif self.rotation_degrees < -4.0:
		# self.pivot_offset.x = randf_range(0.0, 25.0)
		direction = 0
	pass

func _on_button_pressed() -> void:
	G.SoundHelpers.play_async(G, G.SELECT_SOUND)
	pass # Replace with function body.

func _on_button_focus_entered() -> void:
	G.SoundHelpers.play_async(G, G.HOVER_SOUND)
	pass # Replace with function body.

func _on_back_button_mouse_entered() -> void:
	G.SoundHelpers.play_async(G, G.HOVER_SOUND)
	pass # Replace with function body.


func _on_back_button_focus_entered() -> void:
	G.SoundHelpers.play_async(G, G.HOVER_SOUND)
	pass # Replace with function body.


func _on_back_button_pressed() -> void:
	G.SoundHelpers.play_async(G, G.SELECT_SOUND)
	pass # Replace with function body.
