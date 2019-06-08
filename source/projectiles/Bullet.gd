extends Area2D

var speed = 1000

func _physics_process(delta: float) -> void:
	global_position.y -= speed * delta

func initialize(pos, rot, speed = 1000):
	self.global_position = pos
	self.rotation_degrees = rot
	self.speed = speed

func _on_Bullet_area_entered(area: Area2D) -> void:
	print(name, " collided")
	queue_free()

func _on_VisibilityNotifier2D_screen_exited() -> void:
	print(name, " freed")
	queue_free()
