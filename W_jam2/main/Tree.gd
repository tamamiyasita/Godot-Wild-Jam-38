extends StaticBody2D

var count := 0

func _on_Area2D_area_entered(area: Area2D) -> void:
	if count < 11:
		count += 1
	elif count > 10:
		$AnimationPlayer.play('ok')
		get_tree().call_group("main", "done_count")
