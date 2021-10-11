extends Sprite


export(NodePath) onready var player = get_node(player) as RigidBody2D


func _physics_process(delta: float) -> void:
	print(player.fan_speed)
	var motion = 0
	if player.applied_force.x <= -424:
		var r = global_rotation
		global_rotation = lerp_angle(r, -.7, .03)
	elif player.applied_force.x >= 424:
		var r = global_rotation
		global_rotation = lerp_angle(r, .7, .03)

	else:
		var r = global_rotation
		motion = lerp_angle(r, 0, .03)
		if abs(motion) < 0.02:
			motion = 0
#		motion = clamp(motion, 0, .001 )

		global_rotation = motion
