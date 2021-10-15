extends RigidBody2D

func _ready() -> void:
	set_as_toplevel(true)


#var velocity = Vector2(350, 0)
#
#
#func _process(delta: float) -> void:
#	velocity.y += gravity * delta
#	position += velocity * delta
#	rotation = velocity.angle()
#

#func _on_Energy_area_entered(area: Area2D) -> void:
#	queue_free()


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_VisibilityNotifier2D_viewport_exited(viewport: Viewport) -> void:
	queue_free()


func _on_Energy_area_entered(area: Area2D) -> void:
	$AnimationPlayer.play('pop')


func _on_Energy_body_entered(body: Node) -> void:
	print(body.name)
	if "Buil" in  body.name:
		queue_free()
	if body.get_class() == "TileMap":
		queue_free()
