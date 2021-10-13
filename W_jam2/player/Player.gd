extends RigidBody2D

export var move_force_amlitude := 600.0
onready var fan = $heri_body/fan_L 

var fan_speed = 0

func _physics_process(delta: float) -> void:
	var direction := Vector2(
		Input.get_action_strength('right') - 
		Input.get_action_strength('left'),
		
		Input.get_action_strength('down') - 
		Input.get_action_strength('up')
	).normalized()
	
	applied_force = direction * move_force_amlitude
	print(applied_force)
	
	if applied_force:
		fan_speed = 3.7
	else:
		fan_speed = .15
		








func cancel_forces() -> void:
	applied_force = Vector2.ZERO
