extends Node2D

onready var layers = [
	$ParallaxBackground/ParallaxLayer,
	$ParallaxBackground/ParallaxLayer2
]

func _process(delta: float) -> void:
	layers[0].motion_offset.y += 500 * delta
	layers[1].motion_offset.y += 800 * delta


func _on_Player_shot_fired(percentage):
	$Camera2D.shake(0.3, 40 * percentage, 10 * percentage);
