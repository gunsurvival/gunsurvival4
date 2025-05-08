extends CanvasLayer
class_name HUD

var ItemSlotScene: PackedScene = preload("res://UI/HUD/ItemSlot/ItemSlot.tscn")

@export var max_slots: int = 8
@export var player: Player
@onready var item_bar: HBoxContainer = $ItemBar

func _ready() -> void:
	player.equipment.connect("slot_changed", _on_slot_changed)

	for i in range(max_slots):
		var child = item_bar.get_child(i)

		if child == null:
			child = ItemSlotScene.instantiate()
			child.owner = self
			item_bar.add_child(child)

		if child is ItemSlot and i < player.equipment.accessories.size():
			child.thumbnail.texture = resize_texture_to_fit(player.equipment.accessories[i].thumbnail, Vector2i(child.texture_rect.get_size().x - 10, child.texture_rect.get_size().y))

	# Always set the right hand to the first accessory (if any)
	if player.equipment.accessories.size() > 0:
		player.equipment.current_slot = 0
		# player.equipment.lefthand = player.equipment.accessories[1]


func resize_texture_to_fit(tex: Texture2D, boundary: Vector2i) -> Texture2D:
	var original_size := tex.get_size()
	var new_scale := min(boundary.x / original_size.x, boundary.y / original_size.y) as float
	var new_size := Vector2(original_size.x * new_scale, original_size.y * new_scale)

	var img := tex.get_image()
	img.resize(new_size.x, new_size.y, Image.INTERPOLATE_TRILINEAR)

	var new_tex := ImageTexture.create_from_image(img)
	return new_tex


func _unhandled_key_input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.is_action_pressed("slot1"):
			choose_slot(0)
		if event.is_action_pressed("slot2"):
			choose_slot(1)
		if event.is_action_pressed("slot3"):
			choose_slot(2)
		if event.is_action_pressed("slot4"):
			choose_slot(3)
		if event.is_action_pressed("slot5"):
			choose_slot(4)
		if event.is_action_pressed("slot6"):
			choose_slot(5)
		if event.is_action_pressed("slot7"):
			choose_slot(6)
		if event.is_action_pressed("slot8"):
			choose_slot(7)
		if event.is_action_pressed("slot9"):
			choose_slot(8)

func choose_slot(index: int) -> void:	
	player.equipment.current_slot = index

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var slot_count = item_bar.get_child_count()
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			player.equipment.current_slot = (player.equipment.current_slot - 1 + slot_count) % slot_count
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			player.equipment.current_slot = (player.equipment.current_slot + 1) % slot_count


func _on_slot_changed() -> void:
	for i in range(item_bar.get_child_count()):
		var slot = item_bar.get_child(i)
		if slot is ItemSlot:
			if i == player.equipment.current_slot:
				slot.texture_rect.modulate = Color(1, 1, 1, 1)  # Fully visible
				slot.thumbnail.modulate = Color(1, 1, 1, 1)
			else:
				slot.texture_rect.modulate = Color(1, 1, 1, 0.8)  # Semi-transparent
				slot.thumbnail.modulate = Color(1, 1, 1, 0.8)
