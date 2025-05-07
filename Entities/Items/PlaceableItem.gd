extends ConsumableItem
class_name PlaceableItem

func _ready() -> void:
	connect("consumed", _on_consumable_item_consumed)

# Add preprocess of consumable item to check if the item is placeable
func consuming(delta: float) -> void:
	# TODO: vibe check: if the item is placeable
	if true:
		super.consuming(delta)

func _on_consumable_item_consumed(player: Player) -> void:
	pass