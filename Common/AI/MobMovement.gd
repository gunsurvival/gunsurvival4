extends Node
class_name MobMovement

# const MAX_VIEW_DISTANCE = 200
const VIEW_ANGLE_DEGREES = 60
const RAYCAST_COUNT = 10

const StateNormal = "Normal"
const StateAggressive = "Aggressive"

@export var velocity_component: VelocityComponent
@export var stats_component: StatsComponent

@onready var state_machine: StateMachine = $StateMachine
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var timer: Timer = $Timer
@onready var collision_shape: CollisionShape2D = $SightScan/CollisionShape2D
@onready var raycasts: Node2D = $Raycasts

var toRotation: float = 0
var currentSpeed: float = 0
var locker: bool = false
# Only enables the raycast when the player is in sight (optimize)
var enable_raycast: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(RAYCAST_COUNT):
		var ray_cast = RayCast2D.new()
		# Middle raycast has initial rotation (0 degrees)
		var angle = VIEW_ANGLE_DEGREES / 2 - (VIEW_ANGLE_DEGREES / RAYCAST_COUNT) * i
		ray_cast.target_position = Vector2(cos(angle), sin(angle)) * (collision_shape.shape as CircleShape2D).radius
		ray_cast.enabled = false
		raycasts.add_child(ray_cast)

	pass # Replace with function body.


func _physics_process(_delta: float) -> void:
	velocity_component.velocity.x = cos(toRotation) * currentSpeed
	velocity_component.velocity.y = sin(toRotation) * currentSpeed

	if enable_raycast:
		for i in range(RAYCAST_COUNT):
			var ray_cast = raycasts.get_child(i) as RayCast2D
			ray_cast.force_raycast_update()
			if ray_cast.is_colliding():
				var collider = ray_cast.get_collider()

				if collider is Player:
					state_machine.state.finished.emit(StateAggressive)
					print("Player in sight, enter racist  mode")
					return

		if state_machine.state.name == StateAggressive:
			state_machine.state.finished.emit(StateNormal)
			print("Player out of sight, enter normal mode")
			return


func _on_timer_timeout() -> void:
	if state_machine.state.has_method("_on_timer_timeout"):
		state_machine.state._on_timer_timeout()


func _on_sight_scan_body_entered(body: Node2D) -> void:
	if body is Player:
		enable_raycast = true
