extends MobMovementState

func physics_update(delta: float) -> void:
	mob_movement.delta_accumulator += delta

	if mob_movement.delta_accumulator >= mob_movement.update_interval:
		mob_movement.delta_accumulator = 0.0
		var actions = ["idle", "move"]
		var random_action = actions[randi() % actions.size()]
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