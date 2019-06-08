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
	var bullet = Instance.Bullet(cannon.global_position, -180, 1600, 10)
	bullet.shooter = self
	get_parent().add_child(bullet)

func move() -> void:
	var new_position = positions[randi() % positions.size()]
	tween.interpolate_property(self, "position", position, new_position, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()

func _on_ShootTimer_timeout() -> void:
	shoot()

func _on_MoveTimer_timeout() -> void:
	move()
