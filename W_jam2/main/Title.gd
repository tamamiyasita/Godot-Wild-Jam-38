extends Control

export(PackedScene) var Cloud

func _unhandled_key_input(event: InputEventKey) -> void:
	if event.is_action_pressed('left'):
		get_tree().change_scene("res://main/Main.tscn")

func _ready() -> void:
	pass


func _on_Timer_timeout() -> void:
	var cloud = Cloud.instance()
	add_child(cloud)
	$Timer.start(3)
