extends Node2D

class_name MapsController

@export var kick_charge_path: NodePath
@export var player_path: NodePath
@export var tilemaps_path: NodePath

var kick_charge: KickCharge
var player_node: CharacterBody2D
var tilemaps_container: TilemapsContainer

var initial_player_pos: Vector2
var initial_maps_pos = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_node = $"../Player".get_character_body()
	initial_player_pos = player_node.position
	kick_charge = $"../Player".get_kick_charge()
				
	if tilemaps_path:
		tilemaps_container = get_node(tilemaps_path)
		for tilebody in tilemaps_container.get_children():
			if tilebody is not RigidBody2D:
				continue
			initial_maps_pos.append(tilebody.position)
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset_level"):
		player_node.position = initial_player_pos
		var i = 0
		for tilebody in tilemaps_container.get_children():
			if tilebody is not RigidBody2D:
				continue
			tilebody.position = initial_maps_pos[i]
			i += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not kick_charge or not player_node or not tilemaps_container:
		return
	for tilebody in tilemaps_container.get_children():
		if tilebody is not RigidBody2D:
			continue
		if not kick_charge.charging and kick_charge.dt_charge > 0:
			var camera = player_node.get_child(2)
			var tile_relpos = tilebody.global_position - camera.global_position
			
			tilebody.gravity_scale = 0.15
			
			var direction =  camera.global_position.direction_to(tile_relpos)#(tilemap_center - player_center) #/ 50#.normalized()'
			tilebody.apply_force(direction * kick_charge.dt_charge * 575)
			tilebody.angular_damp_mode = 1
			tilebody.angular_damp = 9.0
		

			
	
