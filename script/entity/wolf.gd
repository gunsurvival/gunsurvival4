extends Area2D
class_name Wolf

const SPEED = 200

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var toRotation: float = 0
var currentSpeed: float = 0
var velocity: Vector2 = Vector2(0,0)


enum Action {
	ACTION_IDLE,
	ACTION_MOVE
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation = lerp_angle(rotation, toRotation, 0.1)
	velocity.x = cos(toRotation) * currentSpeed
	velocity.y = sin(toRotation) * currentSpeed
	position.x += velocity.x * delta
	position.y += velocity.y * delta


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print('hit player')
		body.changeStatus(Player.Status.STATUS_HIT)


func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		body.changeStatus(Player.Status.STATUS_IDLE)


func _on_action_timer_timeout() -> void:
	var random_state = randi() % Action.size()
	match random_state:
		Action.ACTION_IDLE:
			toRotation = randf_range(0, 2*PI)
			currentSpeed = 0
		Action.ACTION_MOVE:
			toRotation = randf_range(0, 2*PI)
			currentSpeed = (randi() % 2) * SPEED
