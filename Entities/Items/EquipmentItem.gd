extends ConsumableItem
class_name EquipmentItem

@export var time_to_unequip: float = 0.5

func _ready() -> void:
	connect("consumed", _on_consumable_item_consumed)

func consuming(delta: float) -> void:
	# TODO: Check if current equipment is fit (vibe check 🔥🔥)
	if true:
		super.consuming(delta)


func _on_consumable_item_consumed(player: Player) -> void:
	# TODO: equip the item
	pass
	# player.equipment.
