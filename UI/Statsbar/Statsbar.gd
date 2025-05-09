extends Control

var default_stylebox := preload("res://UI/Statsbar/Data/Statsbar.tres")
	

@onready var progress_bar: ProgressBar = $ProgressBar

var hud: HUD
@export var follow_stat: String = "health"
@export var color: Color = Color(1, 0, 0, 1)
@export var color2: Color = Color(1, 0, 0, 1)



func _ready() -> void:
	# await owner.ready
	if owner is HUD:
		hud = owner as HUD
	var style: StyleBoxFlat = default_stylebox.duplicate()
	style.bg_color = color
	progress_bar.add_theme_stylebox_override("fill", style)
	

	# assert(hud, "ItemSlot must be a child of HUD")


func _draw():
	draw_circle(Vector2(10,10), 18, color)
	draw_circle(Vector2(10,10), 15, color2)


func _physics_process(delta: float) -> void:
	if hud != null:
		progress_bar.value = hud.player.stats_component.stats[follow_stat] / float(hud.player.stats_component.stats["max_" + follow_stat]) * 100
			
