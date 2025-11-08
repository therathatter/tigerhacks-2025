extends TextureRect

var bgxspeed := 10.0
var bgyspeed := 10.0
var bgx = true
var bgy = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bgxspeed = randf_range(10.0, 20.0)
	bgyspeed = randf_range(10.0, 20.0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	bgxspeed = 100.0
	bgyspeed = 100.0
	if bgx:
		self.position.x -= bgxspeed * delta
	else:
		self.position.x += bgxspeed * delta
	if bgy:
		self.position.y -= bgyspeed * delta
	else:
		self.position.y += bgyspeed * delta

	var padding = 64
	
	if self.position.x + padding > 0 or self.position.x - padding < -(get_viewport_rect().size.x / 2):
		print("Flipping X")
		bgx = !bgx
		bgxspeed = randf_range(10.0, 20.0)
		
		
	if self.position.y + padding > 0 or self.position.y - padding < -(self.size.y - get_viewport_rect().size.y):# or self.position.y < -(get_viewport_rect().size.y / 2):
		print("Flipping Y")
		bgy = !bgy 
		bgyspeed = randf_range(10.0, 20.0)
		
	
