extends Area2D

export(PackedScene) var Elec

var speed := 10


func _ready() -> void:
	speed = rand_range(25, 75)
	
func _process(delta: float) -> void:
	position.x -= delta * speed


func _on_Cloud_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_Cloud_body_entered(body: Node) -> void:
	if body.name == "Player":
		body.is_shade = true

func _on_Cloud_body_exited(body: Node) -> void:
	if body.name == "Player":
		body.is_shade = false


func _on_Timer_timeout() -> void:
	var elec = Elec.instance()
	add_child(elec)
	elec.global_position = global_position
	elec.global_position.x += rand_range(-150, 150)


