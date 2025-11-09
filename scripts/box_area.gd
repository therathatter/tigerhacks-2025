extends Area2D


@export var egg_rigidbody_path: NodePath
		

func _on_body_entered(body: Node2D) -> void:
	if not egg_rigidbody_path:
		return
	if body == get_node(egg_rigidbody_path):
		print("egg found")
		
