extends Node2D

export(PackedScene) var Pump
export(PackedScene) var Chain

onready var chain :Node2D = $Chin_x
onready var joints :PinJoint2D = $JointBody
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	var p = Pump.instance()
#	add_child(p)
#	for i in range(9):
#		var c = Chain.instance()
#		if i == 0:
#			c.set_node_b(p.get_path())
#		else:
#			c.set_node_b(c.get_path())
#
#
#
	
	joints.set_node_a(get_parent().get_path())
	shot()
	
func shot() -> void:
	for c in chain.get_children():
		c.anime.play("shot")
#		yield(get_tree().create_timer(0.08), "timeout")
		c.set_mode(0)
	yield(get_tree().create_timer(0.3), "timeout")
	
func collect() -> void:
#	for c in chain.get_children():
#		c.weight = 0
#		c.set_gravity_scale(0)
#		c.set_linear_velocity(Vector2.ZERO)
#		c.set_angular_velocity(.0)
	for c in chain.get_children():
		c.anime.play("Rill")
		yield(get_tree().create_timer(0.08), "timeout")
#		c.set_linear_damp(4)
		c.set_mode(3)
		yield(c.anime, "animation_finished" )
	yield(get_tree().create_timer(0.3), "timeout")
	queue_free()
	


