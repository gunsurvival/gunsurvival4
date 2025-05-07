extends Node2D
class_name Equipment


@export var stats: StatsComponent
@export var head: Item : set = set_head
@export var body: Item : set = set_body
@export var lefthand: Item: set = set_lefthand
@export var righthand: Item: set = set_righthand
@export var accessories: Array[Item] = []


func _ready() -> void:
	for item_node: Item in find_children("*", "Item"):
		add_accessory(item_node)


func hand_trigger() -> void:
	if righthand != null:
		righthand.trigger()

	if lefthand != null:
		lefthand.trigger()


func hand_stop_trigger() -> void:
	if righthand != null:
		righthand.stop_trigger()

	if lefthand != null:
		lefthand.stop_trigger()

func set_head(item: Item) -> void:
	head = item
	head.emit_signal("holded")

func set_body(item: Item) -> void:
	body = item
	body.emit_signal("holded")

func set_lefthand(item: Item) -> void:
	lefthand = item
	item.visible = true
	item.rotation = +PI/16
	item.position.x = 70
	item.position.y = -20
	lefthand.emit_signal("holded")

func set_righthand(item: Item) -> void:
	righthand = item
	item.visible = true
	item.rotation = -PI/16
	item.position.x = 70
	item.position.y = 20
	righthand.emit_signal("holded")

func add_accessory(item: Item) -> void:
	item.equipment = self
	item.visible = false
	accessories.append(item)
