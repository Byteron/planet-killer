extends Area2D

onready var cannon := $Cannon

var rot := 0.0

func _process(delta: float) -> void:
	rot += delta * 2

func shoot() -> void:
	var bullet = Instance.Bullet(cannon.global_position, rand_range(-rot, rot), 1600)
	bullet.shooter = self
	get_parent().add_child(bullet)

func _on_Timer_timeout() -> void:
	shoot()
