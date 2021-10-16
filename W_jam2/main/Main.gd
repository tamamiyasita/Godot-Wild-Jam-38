extends Node2D

export(Resource) var level
export(PackedScene) var LEVEL_1
export(PackedScene) var LEVEL_2
export(PackedScene) var LEVEL_3
var count = 0

func _ready() -> void:
	if level.select_level == 1:
		var level_1 = LEVEL_1.instance()
		add_child(level_1)
	elif level.select_level == 2:
		var level_2 = LEVEL_2.instance()
		add_child(level_2)
	elif level.select_level == 3:
		var level_3 = LEVEL_3.instance()
		add_child(level_3)


func done_count() -> void:
	count += 1
	var done = get_tree().get_nodes_in_group("tree").size()
	

	if count == done:
		count = 0
		get_tree().call_group("UI", "alrigt_sign")
		get_tree().call_group("port", "end_sign")
		level.level_var += 1
#		get_tree().change_scene("res://main/LevelSelect.tscn")
		
