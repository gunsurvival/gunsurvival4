extends Resource
class_name Stats

@export var speed: int = 0
@export var max_speed: int = 100
@export var max_health: int = 100
@export var max_hunger: int = 100
@export var max_warmth: int = 100
@export var max_thirst: int = 100

var health: int = max_health
var hunger: int = max_hunger
var warmth: int = max_warmth
var thirst: int = max_thirst