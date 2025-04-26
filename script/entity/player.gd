extends CharacterBody2D
class_name Player

const SPEED = 350.0
const JUMP_VELOCITY = -400.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer
#var status: Status = Status.STATUS_IDLE


func _physics_process(delta: float) -> void:
	move_and_slide()


func changeStatus(s: Status):
	status = s


func _on_status_timer_timeout() -> void:
	print(status)
	match status:
		Status.STATUS_IDLE:
			animation_player.play("RESET")
		Status.STATUS_HIT:
			animation_player.play("hit")
			health.apply(apply_health)
		Status.STATUS_HEAL:
			animation_player.play("heal")
