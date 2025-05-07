extends Area2D
class_name Hurtbox

signal received_damage(damage: int)

@export var stats_component: StatsComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_entered(area:Area2D) -> void:
	if area.owner == owner:
		return

	if area is Hitbox and !area.disabled:
		emit_signal("received_damage", area.damage)
		area.emit_signal("hit")
		print("Received damage: ", area.damage)
		stats_component.stats.health -= area.damage
		return
