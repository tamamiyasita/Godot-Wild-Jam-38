extends Node2D

export(PackedScene) var Energy
var s_velocity := 500
var s_gravity = 250

func _ready() -> void:
	shower_on()

func _physics_process(delta: float) -> void:
	yield(get_tree().create_timer(.8), "timeout")
	shower_on()
	yield(get_tree().create_timer(.8), "timeout")
	
	
func shower_on() -> void:
	var e = Energy.instance() as Area2D
	get_parent().add_child(e)
	e.global_position = get_parent().global_position
#	e.velocity = e.transform.x * s_velocity
#	e.gravity = s_gravity
#
