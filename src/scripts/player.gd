extends CharacterBody2D
class_name Player

@onready var animation_status: Node2D = $AnimationStatus
@onready var stats: Stats = $Stats

func _physics_process(_delta: float) -> void:
	move_and_slide()
