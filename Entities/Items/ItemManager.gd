extends Node2D
class_name ItemManager

var items: Array[Item] = []

func _ready() -> void:
		# Initialize the item manager
		for item_node: Item in find_children("*", "Item"):
			items.append(item_node)
		print(owner, "holding", items)

func use_items() -> void:
		# Use all items in the inventory
		for item: Item in items:
			item.use()
