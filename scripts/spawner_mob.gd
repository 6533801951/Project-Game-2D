extends Node2D

@export var mob_scene: PackedScene
@export var mob_boss_scene: PackedScene
@export var Player: Node2D
@export var spawn_distance: float = 600.0 
@export var spawn_interval: float = 2.0  

var timer: Timer
var boss_timer: Timer
var boss_spawned: bool = false
var boss_instance: Node2D = null

# เก็บ base stat ของ mob
var mob_base_hp: int = 1
var mob_base_damage: int = 1
var mob_base_score: int = 1

# เก็บ base stat ของ boss
var boss_base_hp: int = 10
var boss_base_damage: int = 2
var boss_base_score: int = 5

var boss_death_count: int = 0   # ตัวนับ boss ที่ตายไปแล้ว

func _ready():
	timer = Timer.new()
	timer.wait_time = spawn_interval
	timer.autostart = true
	timer.one_shot = false
	add_child(timer)
	timer.timeout.connect(spawn_mob)
	
	boss_timer = Timer.new()
	boss_timer.wait_time = 20.0   # 60 วินาที
	boss_timer.autostart = true
	boss_timer.one_shot = true
	add_child(boss_timer)
	boss_timer.timeout.connect(spawn_boss)

func spawn_mob():
	if Player == null or not is_instance_valid(Player):
		return
	var mob = mob_scene.instantiate()
	var angle = randf() * TAU
	var spawn_pos = Player.global_position + Vector2(cos(angle), sin(angle)) * spawn_distance
	mob.global_position = spawn_pos
	mob.Player = Player
	
	# อัปเดตค่า mob ตาม base stat
	mob.max_hp = mob_base_hp
	mob.damage = mob_base_damage
	if mob.has_method("set_score_value"):
		mob.set_score_value(mob_base_score)
	
	get_tree().current_scene.add_child(mob)

func spawn_boss():
	if boss_spawned:
		return
	if Player == null or not is_instance_valid(Player):
		return
	boss_instance = mob_boss_scene.instantiate()
	var angle = randf() * TAU
	var spawn_pos = Player.global_position + Vector2(cos(angle), sin(angle)) * spawn_distance
	boss_instance.global_position = spawn_pos
	boss_instance.Player = Player
	
	# อัปเดตค่า boss ตาม base stat
	boss_instance.max_hp = boss_base_hp
	boss_instance.damage = boss_base_damage
	if boss_instance.has_method("set_score_value"):
		boss_instance.set_score_value(boss_base_score)
	
	get_tree().current_scene.add_child(boss_instance)
	boss_spawned = true
	
	boss_instance.tree_exited.connect(_on_boss_died)

func _on_boss_died():
	boss_spawned = false
	boss_instance = null
	boss_death_count += 1
	
	# เพิ่มความสามารถตามเงื่อนไข
	if boss_death_count % 2 == 1:
		# คี่ → เพิ่ม HP
		mob_base_hp += 1
		boss_base_hp += 1
	else:
		# คู่ → เพิ่ม HP, Damage, Score
		mob_base_hp += 1
		mob_base_damage += 1
		mob_base_score += 1
		boss_base_hp += 1
		boss_base_damage += 1
		boss_base_score += 1
		print("Boss ตายลำดับคู่ mob: HP=", mob_base_hp, " DMG=", mob_base_damage, " Score=", mob_base_score)
		print("Boss ตายลำดับคู่ boss: HP=", boss_base_hp, " DMG=", boss_base_damage, " Score=", boss_base_score)
	
	# เพิ่มความยาก: ลดเวลา spawn mob
	spawn_interval = max(0.5, spawn_interval - 0.5)  
	timer.wait_time = spawn_interval
	print("Boss ถูกกำจัด! spawn_interval ใหม่ =", spawn_interval)
	boss_timer.start()
