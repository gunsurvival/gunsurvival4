extends Effect
class_name BurnEffect

var damage_per_tick := 5

func _on_tick():
    if target and target.has_method("apply_damage"):
        target.apply_damage(damage_per_tick)