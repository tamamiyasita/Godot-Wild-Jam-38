extends CanvasLayer

onready var water :TextureProgress = $Water


func water_update(value) -> void:
	water.value += value
	if water.value < 1:
		get_tree().call_group("shower", "stop")
