extends Node2D

@onready var player = $Player
@onready var timer_label = $HUD/timer_label
@onready var hp_label = $HUD/hp_label
@onready var score_label = $HUD/score_label
@onready var level_label = $HUD/level_label
@onready var levelPanel = $HUD/LevelUp
@onready var upgradeOption = $HUD/LevelUp/UpgradeOptions
@onready var itemOption = preload("res://scenes/item_option.tscn")
@onready var bullet = preload("res://scenes/bullet.tscn")
@onready var exp = preload("res://scenes/exp_item.tscn")
@onready var cam = $Player/Camera2D
var time_passed: float = 0.0
var is_playing: bool = true
var score: int = 0

@onready var pause_menu = $HUD/PauseMenu   # สมมติวางไว้ใน HUD

func _ready():
	player.connect("leveled_up", Callable(self, "levelup"))
	
func _process(delta):
	if is_playing:
		time_passed += delta
		_update_timer_label()
		_update_hp_label()
		_update_score_label()
		_update_level_label()
		
func _input(event):
	if event.is_action_pressed("pause_game"):
		if get_tree().paused:
			pause_menu._on_resume_pressed()
		else:
			pause_menu.show_stats(player, self)

func _update_hp_label():
	if player:
		var hp = max(player.current_health, 0)
		hp_label.text = "HP: %d/%d" % [hp, player.max_health]
		
func _update_score_label():
	score_label.text = "Score: %d" % score
	
func _update_timer_label():
	var minutes = int(time_passed / 60)
	var seconds = int(time_passed) % 60
	timer_label.text = "%02d:%02d" % [minutes, seconds]
	
func _update_level_label():
	if player:
		level_label.text = "Lv.%d (EXP: %d/%d)" % [
			player.level,
			player.exp,
			player.exp_to_next
		]
# เรียกฟังก์ชันนี้เมื่อผู้เล่นตาย
func add_score(points: int = 1):
	score += points
	_update_score_label()
	
func stop_timer():
	is_playing = false
	GameData.final_time = time_passed

func levelup():
	$HUD/LevelUp/levelup_sound.play()
	var tween = levelPanel.create_tween()
	tween.tween_property(levelPanel, "position", Vector2(625,200), 0.2).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()
	levelPanel.visible = true
	var option = 0
	var max_option = 3
	while option < max_option:
		var option_choice = itemOption.instantiate()
		option_choice.item = player.get_random_item()
		upgradeOption.add_child(option_choice)
		option += 1
	get_tree().paused = true
	
func upgrade_character(upgrade):
	match upgrade:
		"ammo_skill1","ammo_skill2","ammo_skill3","ammo_skill4":
			player.additional_attacks += 1
		"attackspeed_skill1","attackspeed_skill2","attackspeed_skill3","attackspeed_skill4":
			player.fire_rate -= 0.1
		"camera_skill1","camera_skill2":
			cam.zoom -= Vector2(0.1,0.1)
		"damage_skill1","damage_skill2","damage_skill3","damage_skill4":
			player.damage_bonus += 1
		"expup_skill1","expup_skill2":
			player.exp_bonus += 1
		"heal_skill":
			player.current_health += 2
			player.current_health = clamp(player.current_health, 0, player.max_health)
			_update_hp_label()
		"maxhp_skill1","maxhp_skill2","maxhp_skill3","maxhp_skill4":
			player.max_health += 3
			_update_hp_label()
		"speedup_skill1","speedup_skill2","speedup_skill3","speedup_skill4":
			player.speed += 25
	$Upgrade2Sound.play()
	var option_childen = upgradeOption.get_children()
	for i in option_childen:
		i.queue_free()
	player.upgrade_options.clear()
	player.collected_upgrades.append(upgrade)
	levelPanel.visible = false
	levelPanel.position = Vector2(625,200)
	get_tree().paused = false
	player.gain_exp()
