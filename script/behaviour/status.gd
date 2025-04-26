extends Node
class_name Status

@export var base_speed: float

var speed: float = base_speed
var health: float = 100
var food: float = 100
var warm: float = 100
var water: float = 100

var effects: Array[Effect]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func apply_health(h):
	health = max(0, h)
func apply_food(f):
	food = max(0, f)
func apply_warm(w):
	warm = max(0, w)
func apply_water(w):
	water = max(0, w)
