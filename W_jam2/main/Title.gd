extends Control

export(PackedScene) var Cloud

func _unhandled_key_input(event: InputEventKey) -> void:
	$AnimationPlayer.play('pressed')
	yield($AnimationPlayer, "animation_finished" )
	get_tree().change_scene("res://main/LevelSelect.tscn")

func _ready() -> void:
	pass


func _on_Timer_timeout() -> void:
	var cloud = Cloud.instance()
	$Path2D.add_child(cloud)
	$Timer.start(15)
