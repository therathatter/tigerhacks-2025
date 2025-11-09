extends Node2D

class_name MapsController

@export var kick_charge_path: NodePath
@export var player_path: NodePath
@export var tilemaps_path: NodePath

var kick_charge: KickCharge
var player_node: CharacterBody2D
var tilemaps_container: TilemapsContainer

#ugly and inefficient I know trust me
func find_character_body(node: Node) -> CharacterBody2D:
	if node is CharacterBody2D:
		return node
	
	for child in node.get_children():
		var result = find_character_body(child)
		if result:
			return result
	return null


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if kick_charge_path:
		kick_charge = get_node(kick_charge_path)
	if player_path:
		var node = find_character_body(get_node(player_path))
		player_node = node as CharacterBody2D
				
	if tilemaps_path:
		tilemaps_container = get_node(tilemaps_path)


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
			
			tilebody.angular_damp = 2.0
			tilebody.gravity_scale = 0.15
			
			var direction =  camera.global_position.direction_to(tile_relpos)#(tilemap_center - player_center) #/ 50#.normalized()'
			#print(direction)
			#print('tilemap pos:', tile_relpos)
			#print('player pos:', camera.global_position)
			tilebody.apply_impulse(direction * 5)
			#tilebody.apply_force(direction * delta * kick_charge.dt_charge*5000, tile_relpos)
			#tilebody.position += direction * (delta * kick_charge.dt_charge * 50) #draw straight line to tilemap, move the whole tilemap by dt_charge * 50 in that direction

			
	
