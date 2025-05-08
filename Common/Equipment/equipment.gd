extends Node2D
class_name Equipment

@export var stats: StatsComponent
@export var head: Item: set = set_head
@export var body: Item: set = set_body
@export var hand: Item: set = set_hand
@export var accessories: Array[Item] = []


func _ready() -> void:
	for item_node: Item in find_children("*", "Item"):
		add_accessory(item_node)


func hand_trigger() -> void:
	if hand != null:
		hand.trigger()


func hand_stop_trigger() -> void:
	if hand != null:
		hand.stop_trigger()


func set_head(item: Item) -> void:
	head = item
	head.emit_signal("holded")


func set_body(item: Item) -> void:
	body = item
	body.emit_signal("holded")


func set_hand(item: Item) -> void:
	_switch_from_to(hand, item)
	hand = item


func add_accessory(item: Item) -> void:
	item.equipment = self
	item.visible = false
	accessories.append(item)


func _switch_from_to(current: Item, to: Item) -> void:
	if current != null:
		current.visible = false
		current.is_triggering = false
		current.stop_trigger()

	if to != null:	
		to.visible = true
		to.rotation = -PI/16
		to.position.x = 70
		to.position.y = 20
		to.emit_signal("holded")


func switch_to_index(index: int) -> void:
	if index < 0 or index >= accessories.size():
		hand = null
		return

	hand = accessories[index]
