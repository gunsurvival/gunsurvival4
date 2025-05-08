extends RigidBody2D

@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	# Set the initial velocity of the bullet
	# velocity_component.velocity = 
	pass


func _on_hitbox_hit() -> void:
	queue_free()
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if linear_velocity.length() < 10:
		queue_free()
		return

func _process(delta: float) -> void:
	sprite_2d.rotation = -rotation  + atan2(linear_velocity.y, linear_velocity.x)
	# print(rotation)
