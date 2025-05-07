extends Area2D
class_name Hitbox

signal hit()

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

@export var damage: int = 0
var disabled: bool:
	get:
		return collision_shape_2d.disabled

	set(value):
		collision_shape_2d.disabled = value


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
