extends Node2D

var speed = 1000
var shooter = null

onready var bullet := $Bullet

func _physics_process(delta: float) -> void:
	bullet.position.y -= speed * delta

func initialize(pos, rot, speed = 1000):
	position = pos
	rotation_degrees = rot
	speed = speed

func _on_Bullet_area_entered(area: Area2D) -> void:

	if shooter == area:
		return

	print(name, " collided with ", area.name)
	queue_free()

func _on_VisibilityNotifier2D_screen_exited() -> void:
	print(name, " freed")
	queue_free()
