extends CharacterBody2D
class_name Player

@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var stats_component: StatsComponent = $StatsComponent
@onready var weapon: Node2D = $Weapon

func _physics_process(_delta: float) -> void:
	weapon.scale.y = sign(cos(rotation))
	move_and_slide()

func _process(_delta: float) -> void:
	weapon.scale.y = sign(cos(rotation))
