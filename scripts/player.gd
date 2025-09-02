extends CharacterBody2D
class_name Player
signal leveled_up

@export var speed : float = 100.0
@export var bullet_scene: PackedScene
@onready var muzzle_point = $Muzzle

var max_health: int = 3
var current_health: int = max_health
var invincible: bool = false       
@export var invincible_time: float = 1.0 
var is_dead: bool = false

var fire_rate := 1.0 # หน่วงเวลาระหว่างการยิงแต่ละครั้ง (วินาที)
var fire_cooldown := 0.0
var damage_bonus: int = 0

var level: int = 1
var exp: int = 0
var exp_to_next: int = 5  # ค่า EXP ที่ต้องใช้ในการเลเวลอัพครั้งแรก
var exp_bonus: int = 0
#Upgrade
var collected_upgrades =[]
var upgrade_options = []
var add_speed = 0
var additional_attacks = 0

func read_input() -> Vector2:
	var input_vector := Vector2.ZERO
	if Input.is_action_pressed("right"):
		input_vector.x += 1
	if Input.is_action_pressed("left"):
		input_vector.x -= 1
	if Input.is_action_pressed("down"):
		input_vector.y += 1
	if Input.is_action_pressed("up"):
		input_vector.y -= 1
	return input_vector.normalized()

func _physics_process(delta: float) -> void:
	if is_dead:
		return
	var direction = read_input()
	velocity = direction * speed
	
	if direction != Vector2.ZERO:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.play("idle")
	move_and_slide()
	
	var mouse_pos = get_global_mouse_position()
	if mouse_pos.x < global_position.x:
		$AnimatedSprite2D.flip_h = true   # เมาส์อยู่ทางซ้าย → พลิก
		muzzle_point.position.x = -abs(muzzle_point.position.x)
	else:
		$AnimatedSprite2D.flip_h = false  # เมาส์อยู่ทางขวา → หันปกติ
		muzzle_point.position.x = abs(muzzle_point.position.x)
	
	if fire_cooldown > 0:
		fire_cooldown -= delta
	# ถ้ากดปุ่มค้าง และ cooldown หมดแล้ว -> ยิง
	if Input.is_action_pressed("shoot") and fire_cooldown <= 0:
		$ShootSound.play()
		shoot()
		fire_cooldown = fire_rate
	
func shoot():	
	if additional_attacks == 0:
		var bullet = bullet_scene.instantiate()
		bullet.global_position = muzzle_point.global_position
		var dir = (get_global_mouse_position() - muzzle_point.global_position).normalized()
		bullet.rotation = dir.angle()
		if bullet.has_method("set_direction"):
			bullet.set_direction(dir)
		bullet.damage += damage_bonus
		get_tree().current_scene.add_child(bullet)
	else:
		var base_dir = (get_global_mouse_position() - muzzle_point.global_position).normalized()
		var base_angle = base_dir.angle()
		var num_bullets = additional_attacks + 1
		var spread = deg_to_rad(20)

		for i in range(num_bullets):
			var t = (i - (num_bullets - 1) / 2.0) / ((num_bullets - 1) / 2.0)
			var angle = base_angle + t * spread / 2
			var dir = Vector2(cos(angle), sin(angle))

			var b = bullet_scene.instantiate()
			b.global_position = muzzle_point.global_position
			b.rotation = angle
			if b.has_method("set_direction"):
				b.set_direction(dir)
			# 🟢 เซ็ตค่า damage ของกระสุน = ค่า base (ใน scene) + bonus
			b.damage += damage_bonus
			get_tree().current_scene.add_child(b)

func gain_exp(amount: int = 1) -> void:
	$UpgradeSound.play()
	exp += amount
	if exp >= exp_to_next:
		exp -= exp_to_next
		level += 1
		exp_to_next += 5  # หรือจะคูณ 2 ก็ได้ เช่น exp_to_next *= 2
		if get_parent().has_method("_update_level_label"):
			get_parent()._update_level_label()
		emit_signal("leveled_up")
		
		
func take_damage(amount: int = 1) -> void:
	if invincible or is_dead:
		return
	$HitSound.play()
	current_health -= amount
	print("Player HP:", current_health)
	if get_parent().has_method("_update_hp_label"):
		get_parent()._update_hp_label()
	invincible = true
	start_invincibility()
	if current_health <= 0:
		$DeadSound.play()
		die()

func start_invincibility():
	var blink_timer = Timer.new()
	blink_timer.wait_time = invincible_time
	blink_timer.one_shot = true
	add_child(blink_timer)
	blink_timer.timeout.connect(_end_invincibility)
	blink_timer.start()

	# ทำเอฟเฟกต์กระพริบ (optional)
	$AnimatedSprite2D.modulate = Color(1, 1, 1, 0.5)
func _end_invincibility():
	invincible = false
	$AnimatedSprite2D.modulate = Color(1, 1, 1, 1)

func die() -> void:
	if is_dead:
		return
	is_dead = true
	print("Player ตายแล้ว!")
	# โหลด GameOver Scene
	$AnimatedSprite2D.play("dead")
	velocity = Vector2.ZERO
	GameData.final_score = get_parent().score
	if get_parent().has_method("stop_timer"):
		get_parent().stop_timer()

	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func get_random_item():
	var dblist = []
	for i in UpgradeDb.UPGRADES:
		if i in collected_upgrades:
			pass
		elif i in upgrade_options:
			pass
		elif UpgradeDb.UPGRADES[i]["type"] == "item":
			pass
		elif UpgradeDb.UPGRADES[i]["prerequisite"].size() > 0:
			for n in UpgradeDb.UPGRADES[i]["prerequisite"]:
				if not n in collected_upgrades:
					pass
				else:
					dblist.append(i)
		else:
			dblist.append(i)
	if dblist.size() > 0:
		var randomitem = dblist.pick_random()
		upgrade_options.append(randomitem)
		return randomitem
	else:
		return null
	
