extends Control

@export var stats_component: StatsComponent
@onready var label: Label = $Label


func _process(delta: float) -> void:
	rotation = -get_parent().rotation
	label.text = str(stats_component.stats.health)
