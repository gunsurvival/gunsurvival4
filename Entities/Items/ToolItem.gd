extends Item
class_name ToolItem

signal used

@export var repeatable: bool = true
@export var time_to_pickup: float = 0.5
@export var time_to_use: float = 0.5

var cooldown: float = 0.0
var _just_used: bool = false


func _ready() -> void:
	connect("holded", _on_item_holded)
	connect("stopped_triggering", _on_item_stopped_triggering)


func _physics_process(delta: float) -> void:
	cooldown -= delta

	# If we are not in cooldown, we can use the item
	# If repeatable is true, we can use the item again, else we need to wait till stopped triggering
	if is_triggering and (repeatable || _just_used == false):
		if cooldown <= 0:
			cooldown = time_to_use
			emit_signal("used")
			_just_used = true


func _on_item_holded() -> void:
	cooldown = time_to_pickup


func _on_item_stopped_triggering() -> void:
	if _just_used:
		_just_used = false
