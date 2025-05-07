extends ToolItem
class_name AK47
var Bullet: PackedScene = preload("res://Entities/Items/Other/Bullet/Bullet.tscn")
@onready var bullets: Node = get_tree().current_scene.get_node("bullets")


func _on_used() -> void:
	var bullet = Bullet.instantiate()
	bullet.position = owner.position + Vector2(cos(owner.rotation), sin(owner.rotation)) * 60
	bullet.rotation = owner.rotation
	bullets.add_child(bullet)

	pass # Replace with function body.
