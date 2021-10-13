extends Area2D

var velocity = Vector2(350, 0)


func _process(delta: float) -> void:
	velocity.y += gravity * delta
	position += velocity * delta
	rotation = velocity.angle()


#func _on_Energy_area_entered(area: Area2D) -> void:
#	queue_free()
