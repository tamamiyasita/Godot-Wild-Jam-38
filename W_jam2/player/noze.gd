extends Sprite

onready var shower =$Shower
# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
onready var b = get_parent().flip_h

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func shot() -> void:
	shower.on_shower = true
	print(b, "BBB")
	$AnimationPlayer.play('shot')
	yield($AnimationPlayer, "animation_finished" )
	$AnimationPlayer2.play('default')
	b = get_parent().flip_h
	shower.shower()
func stop() -> void:
	shower.on_shower = false
	$AnimationPlayer.play('stop')
	$AnimationPlayer2.play('stop')
