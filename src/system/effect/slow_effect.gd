extends Effect

class_name SlowEffect

var speed_multiplier := 0.5

func start():
    if target and target.has_method("set_speed_multiplier"):
        target.set_speed_multiplier(speed_multiplier)

    await get_tree().create_timer(duration).timeout
    if target and target.has_method("set_speed_multiplier"):
        target.set_speed_multiplier(1.0)
    queue_free()