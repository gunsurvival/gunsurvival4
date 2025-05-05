extends MobMovementState

func enter(previous_state_path: String, data := {}) -> void:
	pass

func _on_timer_timeout() -> void:
	var actions = ["idle", "move"]
	var random_action = randi() % actions.size()
	mob_movement.locker = !mob_movement.locker
	if mob_movement.locker:
		mob_movement.currentSpeed = 0
		return

	match random_action:
		"idle":
			mob_movement.toRotation = randf_range(0, 2*PI)
			mob_movement.currentSpeed = 0

		"move":
			mob_movement.toRotation = randf_range(0, 2*PI)
			mob_movement.currentSpeed = (randi() % 2) * mob_movement.stats_component.stats.speed
