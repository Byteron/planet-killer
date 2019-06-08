extends Area2D

onready var cannon := $Cannon

var spread := 0.0

func _process(delta: float) -> void:
	spread += delta * 2

func shoot() -> void:
	var bullet = Instance.Bullet(cannon.global_position, rotation_degrees, 1600, spread)
	bullet.shooter = self
	get_parent().add_child(bullet)

func _on_Timer_timeout() -> void:
	shoot()
