extends Effect

class_name PoisonEffect

var damage_per_tick := 2

func _on_tick():
    if target and target.has_method("apply_damage"):
        target.apply_damage(damage_per_tick)