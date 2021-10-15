extends RigidBody2D

export(NodePath) onready var UI = get_node(UI) as CanvasLayer
export var move_force_amlitude := 600.0
export(PackedScene) var PumpBox



onready var fan = $heri_body/fan_L 
onready var noze :Sprite = $heri_body/noze
onready var body :Sprite = $heri_body
var pump = null

var f = 0.001

var fan_speed = 0
var burst = false

func _physics_process(delta: float) -> void:
	var direction := Vector2(
		Input.get_action_strength('right') - 
		Input.get_action_strength('left'),
		
		Input.get_action_strength('down') - 
		Input.get_action_strength('up')
	).normalized()
	
	applied_force = direction * move_force_amlitude
	if applied_force:
		f += .1
#		f += abs(linear_velocity.y+linear_velocity.x) * 0.0001
		f = clamp(f, 0.001, 1)
		fan_speed = f

	elif !applied_force:
		f -= .009
		f = clamp(f, 0.01, 1)
		fan_speed = f
	

	


func _unhandled_input(event: InputEvent) -> void:
	if burst == false:
		if event.is_action_pressed('pump_switch'):
			if pump == null:
				pump = PumpBox.instance()

				pump.position = $heri_body/P_pos1.position

				add_child(pump)
			elif pump != null:
				pump.collect()
				pump = null
		if event.is_action_released('shower'):
			noze.stop()
		elif event.is_action_pressed('shower') and UI.water.value > 1:
			noze.shot()
		






func cancel_forces() -> void:
	applied_force = Vector2.ZERO


func _on_Area2D_body_entered(body: Node) -> void:
	burst = true
	$Area2D/AnimationPlayer.play('burst')
#	pass
