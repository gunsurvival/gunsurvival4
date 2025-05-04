extends State
class_name MobMovementState

enum STATE {
	NORMAL,
	AGGRESSIVE,
}

var mob_movement: MobMovement


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(owner)
	await owner.ready
	mob_movement = owner as MobMovement
	# print(mob_movement, self.name)
	# assert(mob_movement != null, "ModMovementState must be attached to a MobMovement node.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
