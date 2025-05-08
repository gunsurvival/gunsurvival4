extends ToolItem
class_name AK47
var Bullet: PackedScene = preload("res://Entities/Items/Other/Bullet/Bullet.tscn")
@onready var bullets: Node = get_tree().current_scene.get_node("bullets")


func _on_used() -> void:
	var bullet = Bullet.instantiate()
	
	var spread_degrees = 10.0  # total spread range
	var std_dev = spread_degrees / 3.0  # ~99% within ±spread

	var spread_radians = deg_to_rad(rand_normal(0.0, std_dev))
	var rot =  owner.rotation + spread_radians

	bullet.position = owner.position + Vector2(cos(rot), sin(rot)) * 60
	bullet.rotation = rot
	bullet.linear_velocity  = Vector2(1, 0).rotated(rot) * 2000
	bullets.add_child(bullet)

	pass # Replace with function body.

func rand_normal(mean: float = 0.0, stddev: float = 1.0) -> float:
	var u1 = randf()
	var u2 = randf()
	var z0 = sqrt(-2.0 * log(u1)) * cos(2.0 * PI * u2)
	return z0 * stddev + mean