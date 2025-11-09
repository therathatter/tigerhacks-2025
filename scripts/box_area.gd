extends Area2D

@export var egg_rigidbody_path: NodePath

func _on_body_entered(body: Node2D) -> void:
	if not egg_rigidbody_path:
		return
	if body == get_node(egg_rigidbody_path):
		print("egg found")
		body.sleeping = true
		#var tween := create_tween()
		#tween.tween_property(body, "position", $"../Player".calculate_relative_pos(self.position), 1.0)
		#await tween.finished
		body.gravity_scale = 999
		$"../Player".show_win()
		
