extends Node2D
class_name Item

signal triggered
signal stopped_triggering
signal stack_empty
signal stack_changed
signal stack_full
signal holded


@export var thumbnail: Texture2D
@export var stack_max: int = 69

# Parent equipment node of the item
var equipment: Equipment
var stack: float = 1: set = _set_stack;
var is_triggering: bool = false

func _ready() -> void:
	assert(equipment != null, "Equipment is null")

func _set_stack(value: float) -> void:
		# Set the stack size
		emit_signal("stack_changed", clamp(value, 0, stack_max))

		if stack <=0:
			queue_free()
			emit_signal("stack_empty")
		if value >= stack_max:
			emit_signal("stack_full")
		
		stack = clamp(value, 0, stack_max)

func trigger() -> void:
	if is_triggering == false:
		is_triggering = true
		emit_signal("triggered")

func stop_trigger() -> void:
	if is_triggering == true:
		is_triggering = false
		emit_signal("stopped_triggering")