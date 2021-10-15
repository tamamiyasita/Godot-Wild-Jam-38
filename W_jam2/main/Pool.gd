extends Node2D

var is_pump_in := false

func _ready() -> void:
	set_process(false)
	
func _process(delta: float) -> void:
	if is_pump_in:
		get_tree().call_group("UI", "water_update", .4)
		get_tree().call_group("chainbox", "water_supply")


func _on_Area2D_area_entered(area: Area2D) -> void:
	is_pump_in = true
	set_process(true)

func _on_Area2D_area_exited(area: Area2D) -> void:
	is_pump_in = false
	set_process(false)
