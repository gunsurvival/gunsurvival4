extends Node2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hurtbox_component_body_entered(body:Node2D) -> void:
	animation_player.play("shake")


func _on_hurtbox_component_body_exited(body:Node2D) -> void:
	animation_player.play_backwards("shake")
	animation_player.stop()
