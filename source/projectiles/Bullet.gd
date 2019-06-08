extends Node2D
class_name Bullet

var speed := 1000

var shooter = null

onready var bullet := $Bullet

func _physics_process(delta: float) -> void:
	bullet.position.y -= speed * delta

func initialize(pos, rot, speed, spread):
	position = pos
	rotation_degrees = rot + rand_range(spread, -spread)
	speed = speed

func _on_Bullet_area_entered(area) -> void:

	if shooter == area:
		return

	var parent = area.get_parent()

	if parent.get("shooter"):
		if parent.shooter == shooter:
			return

	if area.name == "Player":
		area.queue_free()

	if area.get("id") == "Enemy":
		area.queue_free()

	print(name, " collided with ", area.name)
	queue_free()

func _on_VisibilityNotifier2D_screen_exited() -> void:
	print(name, " freed")
	queue_free()
