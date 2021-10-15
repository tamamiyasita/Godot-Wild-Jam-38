extends Node2D

export(PackedScene) var Pump
export(PackedScene) var Chain

onready var chain :Node2D = $Chin_x
onready var joints :PinJoint2D = $JointBody
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	joints.set_node_a(get_parent().get_path())
	shot()

func water_supply() -> void:
	if get_parent().UI.water.value < 100:
		var c_list = chain.get_children()
		for c in c_list:
			c.anime.play("water supply")
			yield(c.anime, "animation_finished" )



func shot() -> void:
	for c in chain.get_children():
		c.anime.play("shot")
		c.set_mode(0)
	yield(get_tree().create_timer(0.3), "timeout")
	
func collect() -> void:

	for c in chain.get_children():
		c.anime.play("Rill")
		yield(get_tree().create_timer(0.08), "timeout")
		c.set_mode(3)
		yield(c.anime, "animation_finished" )
	yield(get_tree().create_timer(0.3), "timeout")
	queue_free()
	


