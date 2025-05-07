extends Item
class_name ConsumableItem

signal consumed()

# How much stack we consume when using this item
@export var stack_consume: int = 1
# How long it takes to consume the item
@export var time_to_consume: float = 0.5
# @export var allow_abort: bool = true

var time_to_comsume_accumulated: float = 0.0

func _physics_process(delta: float) -> void:
	# If we are consuming the item, we need to update the time
	if is_triggering:
		consuming(delta)
		

func consuming(delta) -> void:
	time_to_comsume_accumulated += delta

	if time_to_comsume_accumulated >= time_to_consume:
		stack -= stack_consume
		time_to_comsume_accumulated = 0.0
		emit_signal("consumed")
