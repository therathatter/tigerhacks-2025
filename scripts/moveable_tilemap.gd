extends TileMapLayer
class_name MovableTileMapLayer

# Called when the node enters the scene tree for the first time.
@export var kick_charge_path: NodePath
@export var player_path: NodePath

var kick_charge: KickCharge
var player: CharacterBody2D



func _ready() -> void:
	if kick_charge_path:
		kick_charge = get_node(kick_charge_path)
	if player_path:
		var node = get_node(player_path)
		node = node.get_child(0)
		node = node.get_child(0)
		player = node
		
		
		print("Node:", node)
		print("Type:", node.get_class())
		print("Script:", node.get_script())

		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not kick_charge:
		return
	if not player:
		#print('test')
		return
	if not kick_charge.charging:
		var direction = self.position - player.position
		self.position += direction * delta * kick_charge.dt_charge * 10
