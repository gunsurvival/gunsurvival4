extends Node

const MOB_COUNT = 0
@export var entities: Node
var WolfScene = preload("res://src/scenes/entity/wolf.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# spawn random wolf
	for i in MOB_COUNT:
		var mob = WolfScene.instantiate()

		# Set a random position within screen bounds (customize as needed)
		mob.position = Vector2(
			randf_range(0, 800), # example x range
			randf_range(0, 600), # example y range
		)

		entities.add_child(mob)


func _on_timer_timeout() -> void:
	var wolf: Wolf = WolfScene.instantiate()
	wolf.position = Vector2(100, 200) # Change as needed
	entities.add_child(wolf)
