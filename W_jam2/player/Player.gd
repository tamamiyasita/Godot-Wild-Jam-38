extends RigidBody2D
## TODO 
# 0 散水効果の実装(粒子をhide状態で混ぜる)
# 1 給水用の水シェーダーについて学び実装する
# 2 ﾋﾞﾙ、水源の地形Object作成
# 3 視差背景と空テクスチャ
# 4 雲の仕様を考える(Area2Dで影の効果を付ける)
# 5 水を与えたObjectとの相互作用とDoneカウンタ(ﾊｰﾄ型)
# 6 ProgressBar(水量と光量)
# 7 Wlorldノードの実装
# 8 camera範囲の設定
# 9 score表示


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
			pump.position.y += 10
			pump.position.x += 13
			add_child(pump)


		elif pump != null:
			pump.collect()
			pump = null



func cancel_forces() -> void:
	applied_force = Vector2.ZERO
