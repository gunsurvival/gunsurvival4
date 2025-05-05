extends Node
class_name MobMovement

@export var velocity_component: VelocityComponent
@export var stats_component: StatsComponent
@onready var state_machine: StateMachine = $StateMachine

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
	if state_machine.state.has_method("_on_timer_timeout"):
		state_machine.state._on_timer_timeout()
