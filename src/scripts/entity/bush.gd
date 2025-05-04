extends Node2D
class_name Bush

@onready var animation_player: AnimationPlayer = $View/Sprite2D/AnimationPlayer
@onready var shake_area: Area2D = $ShakeArea

var body_entered: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	pass


func _on_shake_area_body_entered(body: Node2D) -> void:
	# pass
	# body_entered += 1
	animation_player.play("shake")


func _on_shake_area_body_exited(body: Node2D) -> void:
	# pass
	# body_entered -= 1
	animation_player.pause()
