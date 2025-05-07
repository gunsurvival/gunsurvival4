extends RigidBody2D

@onready var velocity_component: VelocityComponent = $VelocityComponent


func _ready() -> void:
	# Set the initial velocity of the bullet
	# velocity_component.velocity = 
	linear_velocity  = Vector2(1, 0).rotated(rotation) * 1000


func _on_hitbox_hit() -> void:
	queue_free()
	pass # Replace with function body.
