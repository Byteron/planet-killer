extends Node2D


func _on_Player_shot_fired(percentage):
	$Camera2D.shake(0.3, 40 * percentage, 10 * percentage);
