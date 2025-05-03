extends Node2D
class_name VelocityComponent

var velocity: Vector2 = Vector2(0, 0) # Replace with actual velocity logic


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	# Example of how to use the velocity component
	# Assuming 'velocity' is a Vector2 property of the node
	# and you want to move the node based on its velocity
	if get_parent() is CharacterBody2D:
		(get_parent() as CharacterBody2D).velocity = velocity
	else:
		get_parent().position += velocity * delta


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
