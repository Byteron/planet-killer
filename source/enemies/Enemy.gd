extends Area2D

onready var cannon := $Cannon

func shoot() -> void:
	var bullet = Instance.Bullet(cannon.global_position, rotation_degrees, 1600)
	get_parent().add_child(bullet)

func _on_Timer_timeout() -> void:
	shoot()
