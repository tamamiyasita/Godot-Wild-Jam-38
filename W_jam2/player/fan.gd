extends Sprite

export(NodePath) onready var player = get_node(player) as RigidBody2D

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
#	if player.fan_speed > 0.001:
	rotation += player.fan_speed
