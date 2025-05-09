extends Control
class_name ItemSlot

@onready var thumbnail: TextureRect = $CenterContainer/Thumbnail
@onready var texture_rect: TextureRect = $TextureRect

var hud: HUD

func _ready() -> void:
	# await owner.ready
	if owner is HUD:
		hud = owner as HUD
	assert(hud, "ItemSlot must be a child of HUD")

func _on_pressed() -> void:
	var index = get_index()
	hud.choose_slot(index)
