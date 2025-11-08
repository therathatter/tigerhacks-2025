extends ProgressBar
class_name KickCharge

var charging = false
var dt_charge = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("kick_charge"):
		charging = true
	elif Input.is_action_just_released("kick_charge"):
		#handle kick
		charging = false
		#now we have dt_charge to represent how strong the kick was
	if charging:
		dt_charge += delta
		if dt_charge > 1.0:
			dt_charge = 1.0
	else:
		if dt_charge:
			dt_charge = move_toward(dt_charge, 0, delta)
		
	self.value = dt_charge * 100
		
