extends MobMovementState

@export var more_sight = 0.1

func enter(_previous_state_path: String, _data := {}) -> void:
	(mob_movement.collision_shape.shape as CircleShape2D).radius *=  1 + more_sight

func exit() -> void:
	(mob_movement.collision_shape.shape as CircleShape2D).radius /= 1 + more_sight


func physics_update(delta: float) -> void:
	mob_movement.delta_accumulator += delta

	if mob_movement.delta_accumulator >= mob_movement.update_interval:
		mob_movement.locker = !mob_movement.locker
		mob_movement.delta_accumulator = 0.0

		if mob_movement.locker:
			if mob_movement.player_follow != null:
				# The farther the player is, the faster the mob moves (less time to locker)
				mob_movement.delta_accumulator = clamp(mob_movement.owner.position.distance_to(mob_movement.player_follow.position) / mob_movement.stats_component.stats.speed, 0.0, 1) * mob_movement.update_interval/2
			mob_movement.currentSpeed = 0
			return

		mob_movement.currentSpeed = mob_movement.stats_component.stats.speed

		if mob_movement.player_follow != null:
			mob_movement.toRotation = mob_movement.owner.position.angle_to_point(mob_movement.player_follow.position)
