extends Sprite


export(NodePath) onready var player = get_node(player) as RigidBody2D


	
func _physics_process(delta: float) -> void:
	var motion = 0
	if player.applied_force.x <= -10:
		var r = global_rotation
		global_rotation = lerp_angle(r, -.7, .03)
		if flip_h == true:
			$AnimationPlayer.play('flip_L')
	elif player.applied_force.x >= 10:
		var r = global_rotation
		global_rotation = lerp_angle(r, .7, .03)
		if flip_h == false:
			$AnimationPlayer.play('flip_R')

	else:
		var r = global_rotation
		motion = lerp_angle(r, 0, .03)
		if abs(motion) < 0.02:
			motion = 0
#		motion = clamp(motion, 0, .001 )

		global_rotation = motion
