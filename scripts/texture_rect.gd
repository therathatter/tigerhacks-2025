extends TextureRect

var doRotate = true
@onready var blackhole = $"../Blackhole";

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func startMoving() -> void:
	var tween := create_tween()
	tween.tween_property(self, "position", blackhole.get_screen_position() + self.size / 2, 5.0)
	await tween.finished
	stopRotating()
	get_tree().change_scene_to_file("res://scenes/tutorial_level.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if doRotate:
		self.rotation_degrees += 90.0 * delta
	pass
	
func stopRotating():
	doRotate = false
