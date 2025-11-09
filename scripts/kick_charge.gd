extends VBoxContainer
class_name KickCharge

var charging = false
var allowed_to_charge = true
var dt_charge = 0.0

var kick_sound = preload("res://sounds/kick.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func play_sound_async(sound):
	var music = AudioStreamPlayer.new()
	music.set_stream(sound)
	music.volume_db = 1
	music.pitch_scale = 1
	self.add_child(music)
	music.play()
	await music.finished
	self.remove_child(music)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("kick_charge") and allowed_to_charge and !$KickAudioStream.playing:
		charging = true
	elif Input.is_action_just_released("kick_charge"):
		if charging:
			play_sound_async(kick_sound)
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
		
