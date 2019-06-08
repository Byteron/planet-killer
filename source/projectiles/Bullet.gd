extends Area2D

export var speed := 400

func _physics_process(delta: float) -> void:
	global_position.y -= speed * delta

func _on_Bullet_area_entered(area: Area2D) -> void:
	queue_free()


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
