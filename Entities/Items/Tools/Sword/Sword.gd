extends Item

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hitbox: Hitbox = $Hitbox

func _ready() -> void:
	hitbox.disabled = true

func use() -> void:
	# Logic for using the sword
	animated_sprite_2d.play("attack")
	print("Sword used!")
		

func _on_animated_sprite_2d_frame_changed() -> void:
	if animated_sprite_2d.frame == 4:
		print("sword hitbox enabled")
		hitbox.disabled = false
	else:
		hitbox.disabled = true
	pass # Replace with function body.
