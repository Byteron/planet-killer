extends Node2D

onready var bullets := $Bullets

onready var score_label := $CanvasLayer/Score
onready var spawn_timer := $SpawnTimer as Timer
onready var health_bar := $CanvasLayer/HealthBar

onready var player := $Player

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _ready() -> void:
	Global.score = 0
	health_bar.value = player.health
	health_bar.max_value = player.health

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

func _on_Player_health_depleted(health) -> void:
	health_bar.value = health