extends ParallaxBackground

onready var layers = [
	$ParallaxLayer,
	$ParallaxLayer2
]

func _process(delta: float) -> void:
	layers[0].motion_offset.y += 500 * delta
	layers[1].motion_offset.y += 800 * delta