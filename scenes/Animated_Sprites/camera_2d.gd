extends Camera2D

var lastX = 0

func get_w():
	return DisplayServer.window_get_size().x
	
func get_h():
	return DisplayServer.window_get_size().y

func z():
	return sqrt((get_w() ** 2) + (get_h() ** 2)) / 768.0

# Called when the noade enters the scene tree for the first time.
func _ready() -> void:
	# hacky, but WORKS!!!!
	# base it on the base vport
	# lastX = 1152
	_process(0.0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# really dumb but yeah
	self.zoom.x = z()
	self.zoom.y = z()
