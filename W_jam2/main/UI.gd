extends CanvasLayer

onready var water :TextureProgress = $Water
onready var solar :TextureProgress = $SolarPower


func water_update(value) -> void:
	water.value += value
	if water.value < 1:
		get_tree().call_group("shower", "stop")

func solar_update(value) -> void:
	solar.value += value
