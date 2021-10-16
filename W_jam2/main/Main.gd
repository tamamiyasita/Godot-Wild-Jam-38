extends Node2D

export(PackedScene) var Cloud


func _ready() -> void:
	pass


func _on_Timer_timeout() -> void:
	var cloud = Cloud.instance()
	$Path2D.add_child(cloud)
	$Timer.start(3)
