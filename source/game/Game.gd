extends Node2D

onready var score_label := $CanvasLayer/Score

onready var spawn_timer := $SpawnTimer as Timer

func _on_Player_shot_fired(percentage):
	$Camera2D.shake(0.3, 40 * percentage, 10 * percentage);

func _on_Player_overheat(timer):
	$Camera2D.shake(timer, 40, 10);

func spawn_enemy():
	var enemy = Instance.Enemy()
	enemy.position.y = -100
	add_child(enemy)

func _on_SpawnTimer_timeout() -> void:
	spawn_enemy()


func _on_ScoreTimer_timeout() -> void:
	Global.score += 10
	score_label.text = str(Global.score)

