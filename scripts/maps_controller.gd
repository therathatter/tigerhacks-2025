extends Node2D

class_name MapsController

@export var kick_charge_path: NodePath
@export var player_path: NodePath
@export var tilemaps_path: NodePath

var kick_charge: KickCharge
var player_node: CharacterBody2D
var tilemaps_container: TilemapsContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_node = $"../Player".get_character_body()
	kick_charge = $"../Player".get_kick_charge()
				
	if tilemaps_path:
		tilemaps_container = get_node(tilemaps_path)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset_level"):
		get_tree().reload_current_scene()
		G.State.BlockInput = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not kick_charge or not player_node or not tilemaps_container:
		return
	for tilebody in tilemaps_container.get_children():
		if tilebody is not RigidBody2D:
			continue
		if not kick_charge.charging and kick_charge.dt_charge > 0 and !G.State.BlockInput:
			var camera = player_node.get_child(2)
			
			# Compute the relative position in world space
			var tile_relpos = tilebody.global_position - camera.global_position

			# Factor in the tilebody's scale
			tile_relpos.x /= tilebody.scale.x
			tile_relpos.y /= tilebody.scale.y

			var direction = tile_relpos.normalized()
			
			tilebody.gravity_scale = 0.15
			
			# var direction =  camera.global_position.direction_to(tile_relpos)#(tilemap_center - player_center) #/ 50#.normalized()'
			tilebody.apply_force(direction * kick_charge.dt_charge * 575)
			tilebody.angular_damp_mode = 1
			tilebody.angular_damp = 9.0
		

			
	
