extends CharacterBody2D
class_name Player

@onready var stats_component: StatsComponent = $StatsComponent
@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var equipment: Equipment = $Equipment
@onready var animation_player: AnimationPlayer = $Sprite2D/AnimationPlayer

func _physics_process(_delta: float) -> void:
	move_and_slide()

func _process(_delta: float) -> void:
	pass
	# item_manager.scale.y = sign(cos(rotation))


func _on_hurtbox_received_damage(damage: int) -> void:
	animation_player.play("hit")
	pass # Replace with function body.
