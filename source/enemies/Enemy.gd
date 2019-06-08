extends Area2D

var spread := 0.0

var positions = []

onready var tween := $Tween as Tween
onready var cannon := $Cannon

func _ready() -> void:
	var size = get_viewport_rect().size
	size.y = size.y / 2
	for i in 5:
		positions.append(Vector2(randi() % int(size.x), randi() % int(size.y)))

func _process(delta: float) -> void:
	spread += delta * 2

func shoot() -> void:
	var bullet = Instance.Bullet(cannon.global_position, rotation_degrees, 1600, spread)
	bullet.shooter = self
	get_parent().add_child(bullet)

func move() -> void:
	pass

func _on_ShootTimer_timeout() -> void:
	shoot()

func _on_MoveTimer_timeout() -> void:
	move()
