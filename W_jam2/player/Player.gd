extends RigidBody2D

export var move_force_amlitude := 600.0
onready var fan = $heri_body/fan_L 
export(PackedScene) var PumpBox
var pump = null
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
		

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('pump_switch'):
		if pump == null:
			pump = PumpBox.instance()
			pump
			pump.position.y += 10
			pump.position.x += 13
			add_child(pump)


		elif pump != null:
			pump.collect()
			pump = null



func cancel_forces() -> void:
	applied_force = Vector2.ZERO
