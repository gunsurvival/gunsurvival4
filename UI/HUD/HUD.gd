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

		if child is ItemSlot and i < player.item_manager.items.size():
			child.thumbnail.texture = player.item_manager.items[i].thumbnail
	
