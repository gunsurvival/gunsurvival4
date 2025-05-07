extends CanvasLayer

var ItemSlotScene: PackedScene = preload("res://UI/HUD/ItemSlot/ItemSlot.tscn")

@export var max_slots: int = 8
@export var player: Player
@onready var hbox_container: HBoxContainer = $HBoxContainer


func _ready() -> void:
	for i in range(max_slots):
		var child = hbox_container.get_child(i)

		if child == null:
			child = ItemSlotScene.instantiate()
			hbox_container.add_child(child)

		if child is ItemSlot and i < player.equipment.accessories.size():
			child.thumbnail.texture = resize_texture_to_fit(player.equipment.accessories[i].thumbnail, Vector2i(child.texture_rect.get_size().x - 10, child.texture_rect.get_size().y))

	# Always set the right hand to the first accessory (if any)
	if player.equipment.accessories.size() > 0:
		player.equipment.righthand = player.equipment.accessories[0]
		player.equipment.lefthand = player.equipment.accessories[1]


func resize_texture_to_fit(tex: Texture2D, boundary: Vector2i) -> Texture2D:
	var original_size := tex.get_size()
	var new_scale := min(boundary.x / original_size.x, boundary.y / original_size.y) as float
	var new_size := Vector2i(original_size.x * new_scale, original_size.y * new_scale)

	var img := tex.get_image()
	img.resize(new_size.x, new_size.y, Image.INTERPOLATE_TRILINEAR)

	var new_tex := ImageTexture.create_from_image(img)
	return new_tex
