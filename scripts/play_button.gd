extends Button



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var checkedController = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Godot bug hack
	if !checkedController and Input.get_connected_joypads().size() != 0:
		if Input.get_connected_joypads().size() != 0:
			self.grab_focus.call_deferred()
		checkedController = true
	pass
	

func _pressed() -> void:
	$"../../AnimationPlayer".play("fade")
	G.State.CurrentLevel = 0
	await $"../../AnimationPlayer".animation_finished
	get_tree().change_scene_to_file(ProjectSettings.globalize_path("res://scenes/intro_cutscene.tscn"))
