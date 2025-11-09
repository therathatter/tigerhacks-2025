extends CharacterBody2D

class_name Player

const SPEED = 150.0
const JUMP_VELOCITY = -450.0
const JUMP_SOUND = preload("res://sounds/jump.mp3")
@onready var animated_sprite = $AnimatedSprite2D

var kicking = false

func _ready() -> void:
	var camera = $Camera2D
	camera.make_current()

func _physics_process(delta: float) -> void:
	if G.State.HasWonLevel:
		velocity = Vector2(0,0)
		return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		G.SoundHelpers.play_async(self, JUMP_SOUND)

	var kicking = animated_sprite.animation == "Kick"

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		if !kicking:
			animated_sprite.play("Move")
		
		if direction < 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x == 0 and velocity.y == 0 and !kicking:
		animated_sprite.play("Idle")
	#if velocity.x == 0 and velocity.y == 0 and !kicking:
	#	animated_sprite.play("Idle")

	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite.play("Idle")
	pass # Replace with function body.
