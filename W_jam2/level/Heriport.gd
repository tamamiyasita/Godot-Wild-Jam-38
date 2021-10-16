extends Sprite

export(PackedScene) var ENDsign


func end_sign() -> void:
	var end = ENDsign.instance()
	get_parent().add_child(end)
	end.global_position = global_position
	end.global_position.y -= 20
