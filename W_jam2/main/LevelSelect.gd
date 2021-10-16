extends Control

export(Resource) var level

func _ready() -> void:
#	level.level_var += 1
	pass

func _on_TextureButton3_pressed() -> void:
	print(level.level_var)
	if 1 <= level.level_var:
		level.select_level = 1
		$AnimationPlayer.play('change_scene')
		yield($AnimationPlayer, "animation_finished" )
		get_tree().change_scene("res://main/Main.tscn")


func _on_TextureButton4_pressed() -> void:
	print(level.level_var)
	if 2 <= level.level_var:
		level.select_level = 2
		$AnimationPlayer.play('change_scene')
		yield($AnimationPlayer, "animation_finished" )
		get_tree().change_scene("res://main/Main.tscn")

func _on_TextureButton5_pressed() -> void:
	print(level.level_var)
	if 3 <= level.level_var:
		level.select_level = 3
		$AnimationPlayer.play('change_scene')
		yield($AnimationPlayer, "animation_finished" )
		get_tree().change_scene("res://main/Main.tscn")
