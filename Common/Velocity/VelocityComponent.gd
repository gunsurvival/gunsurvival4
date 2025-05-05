extends Node2D
class_name VelocityComponent

var velocity: Vector2 = Vector2(0, 0) # Replace with actual velocity logic


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if owner is CharacterBody2D:
		(owner as CharacterBody2D).velocity = velocity
	else: if owner is Node2D:
		(owner as Node2D).position += velocity * delta
	else:
		print(owner, " is not Node2D")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
