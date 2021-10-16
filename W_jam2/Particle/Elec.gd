extends RigidBody2D



func _ready() -> void:
	set_as_toplevel(true)

func _on_Elec_body_entered(body: Node) -> void:
	print(body.name, "ELEC")
#	if body.name == "player":


func _on_Area2D_body_entered(body: Node) -> void:
	$AnimationPlayer.play('shock')
