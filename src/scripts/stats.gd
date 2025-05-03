extends Node
class_name StatsComponent

@export var max_stats := {
		speed = 300,
		health = 100,
		food = 100,
		warm = 100,
		water = 100,
}

@export var stats := {
		speed = 300,
		health = 100,
		food = 100,
		warm = 100,
		water = 100,
}

@onready var current_stats := stats.duplicate(true)

var effects: Array[Effect] = []

func _ready() -> void:  
		pass


func update_stat(stat_name: String, value: int) -> void:
		if not current_stats.has(stat_name):
				push_warning("Stat does not exist: " + stat_name)
				return

		var max_val = max_stats.get(stat_name, 0)
		current_stats[stat_name] = clamp(value, 0, max_val)
	
func get_stat(stat_name: String) -> int:
		if not current_stats.has(stat_name):
				push_warning("Stat does not exist: " + stat_name)
				return 0

		return current_stats[stat_name]
