extends Camera2D

var lastX = 0

func get_x():
	return DisplayServer.window_get_size().x

# Called when the noade enters the scene tree for the first time.
func _ready() -> void:
	# hacky, but WORKS!!!!
	# base it on the base vport
	lastX = 1152
	_process(0.0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lastX != get_x():
		# Calculate the zoom delta
		var xdelta = get_x() - lastX
		var zdelta = xdelta / 1800.0
		self.zoom.x += zdelta
		self.zoom.y += zdelta
		lastX = get_x() 
	pass
