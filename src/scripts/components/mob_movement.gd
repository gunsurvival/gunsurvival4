extends Node2D
class_name MobMovement

enum Action {
	ACTION_IDLE,
	ACTION_MOVE
}

@export var velocity_component: VelocityComponent
@export var stats_component: StatsComponent

var toRotation: float = 0
var currentSpeed: float = 0
var locker: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(_delta: float) -> void:
	velocity_component.velocity.x = cos(toRotation) * currentSpeed
	velocity_component.velocity.y = sin(toRotation) * currentSpeed


func _on_timer_timeout() -> void:
	var random_state = randi() % Action.size()
	locker = !locker
	if locker:
		currentSpeed = 0
		return

	match random_state:
		Action.ACTION_IDLE:
			toRotation = randf_range(0, 2*PI)
			currentSpeed = 0

		Action.ACTION_MOVE:
			toRotation = randf_range(0, 2*PI)
			currentSpeed = (randi() % 2) * stats_component.get_stat("speed")
