extends ParallaxBackground

onready var layers = [
	$ParallaxLayer,
	$ParallaxLayer2,
	$ParallaxLayer3
]

func _ready() -> void:
	layers[1].motion_offset.y += 200

func _process(delta: float) -> void:
	layers[0].motion_offset.y += 200 * delta
	layers[1].motion_offset.y += 240 * delta
	layers[2].motion_offset.y += 880 * delta