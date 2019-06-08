extends Control

onready var score_label := $CenterContainer/VBoxContainer/Score

func show():
	score_label.text = str(Global.score)
	.show()

func _on_Retry_pressed() -> void:
	Scene.change(Scene.Game)

func _on_Quit_pressed() -> void:
	get_tree().quit()