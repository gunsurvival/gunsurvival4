extends Node

@export var player: Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var mousePos = get_viewport().get_mouse_position()
	var screen_center = get_viewport().size / 2
	var toAngle = atan2(mousePos[1] - screen_center[1], mousePos[0] - screen_center[0])
	player.rotation = lerp_angle(player.rotation, toAngle, 0.1)
	player.velocity_component.velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * player.stats_component.stats.speed

	if Input.is_action_just_pressed("left_click"):
		player.item_manager.use_items()
