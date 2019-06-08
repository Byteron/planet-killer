extends AnimatedSprite

func _ready() -> void:
	rotation_degrees = randi() % 360
	play("default")

func _on_Explosion_animation_finished() -> void:
	queue_free()
