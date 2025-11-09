extends VBoxContainer
class_name KickCharge

var charging = false
var allowed_to_charge = true
var dt_charge = 0.0

var kick_sound = preload("res://sounds/kick.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("kick_charge") and allowed_to_charge:
		charging = true
	elif Input.is_action_just_released("kick_charge"):
		if charging:
			G.SoundHelpers.play_async(self, kick_sound)
			$"../../CharacterBody2D/AnimatedSprite2D".play("Kick")
		#handle kick
		charging = false
		allowed_to_charge = false
	if dt_charge == 0:
		allowed_to_charge = true
		#now we have dt_charge to represent how strong the kick was
	if charging:
		dt_charge += delta
		if dt_charge > 1.0:
			dt_charge = 1.0
	else:
		if dt_charge:
			dt_charge = move_toward(dt_charge, 0, delta)
		
	$TextureProgressBar.value = dt_charge * 100
		
