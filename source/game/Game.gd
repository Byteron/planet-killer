extends Node2D

onready var spawn_timer := $SpawnTimer as Timer

func _on_Player_shot_fired(percentage):
	$Camera2D.shake(0.3, 40 * percentage, 10 * percentage);

func _on_Player_overheat(timer):
	$Camera2D.shake(timer, 40, 10);

func spawn_enemy():
	var enemy = Instance.Enemy()
	add_child(enemy)

func _on_SpawnTimer_timeout() -> void:
	spawn_enemy()
