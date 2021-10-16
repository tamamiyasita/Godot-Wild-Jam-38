extends Node2D

export(PackedScene) var Energy
onready var par1 : Particles2D= $Particles2D
onready var par2 : Particles2D= $Particles2D2
var on_shower := false
var flip

func stop() ->void:
	on_shower = false
	
func shower() -> void:
	flip = get_parent().get_parent().flip_h
	if on_shower == true:
#		if flip != null:
		par1.emitting = true
		par2.emitting = true
		yield(get_tree().create_timer(.005), "timeout")
		var e = Energy.instance() as RigidBody2D
		e.global_position = global_position
		var r
		if flip == true:
			e.linear_velocity.x = 90
			r = rand_range(147.0, -27.0)
		elif flip == false:
			e.linear_velocity.x = -90
			r = rand_range(-147.0, 27.0)
		e.linear_velocity.x += r
		add_child(e)
		get_tree().call_group("UI", "water_update", -.2)
			
		shower()
	else:
		par1.emitting = false
		par2.emitting = false
