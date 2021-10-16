extends CanvasLayer

onready var water :TextureProgress = $Water
onready var solar :TextureProgress = $SolarPower
onready var alright :RichTextLabel = $RichTextLabel2


func _ready() -> void:
	alright.hide()

func water_update(value) -> void:
	water.value += value
	if water.value < 1:
		get_tree().call_group("shower", "stop")

func solar_update(value) -> void:
	solar.value += value

func alrigt_sign() -> void:
	alright.show()
	yield(get_tree().create_timer(3), "timeout")
	alright.hide()
