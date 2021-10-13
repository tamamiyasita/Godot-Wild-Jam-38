extends RigidBody2D


onready var anime :AnimationPlayer = $AnimationPlayer

var under_water := false


func _on_Area2D_area_entered(area: Area2D) -> void:
	under_water = true


func _on_Area2D_area_exited(area: Area2D) -> void:
	under_water = false
