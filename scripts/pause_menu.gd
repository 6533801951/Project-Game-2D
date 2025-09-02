extends Control

@onready var max_hp_label = $Panel/VBoxContainer/max_hp_label
@onready var atk_power_label = $Panel/VBoxContainer/attack_power_label
@onready var atk_speed_label = $Panel/VBoxContainer/attack_speed_label
@onready var move_speed_label = $Panel/VBoxContainer/move_speed_label
@onready var addition_ammo_label = $Panel/VBoxContainer/addition_ammo_label
@onready var exp_label = $Panel/VBoxContainer/exp_label
@onready var camera_label = $Panel/VBoxContainer/camera_label
@onready var resume_button = $Panel/ResumeButton
@onready var exit_button = $Panel/exitButton
@export var Player: Node2D
@export var main: Node  # main scene

func _ready():
	# ปิด PauseMenu ไว้ก่อน
	visible = false
	# เชื่อมต่อ signals พร้อมตรวจสอบ
	_connect_signals()
func _connect_signals():
	# สำหรับ resume button
	if resume_button and not resume_button.pressed.is_connected(_on_resume_pressed):
		resume_button.pressed.connect(_on_resume_pressed)
	# สำหรับ exit button  
	if exit_button and not exit_button.pressed.is_connected(_on_exit_button_pressed):
		exit_button.pressed.connect(_on_exit_button_pressed)

func show_stats(player_node, main_node):
	main = main_node  # กำหนดค่า main
	if is_instance_valid(max_hp_label):
		max_hp_label.text = "Max HP: %d" % player_node.max_health
	if is_instance_valid(atk_power_label):
		atk_power_label.text = "Attack Power: %d" % (1 + player_node.damage_bonus)
	if is_instance_valid(atk_speed_label):
		atk_speed_label.text = "Attack Cooldown: %.2f" % player_node.fire_rate
	if is_instance_valid(move_speed_label):
		move_speed_label.text = "Movement Speed: %d" % player_node.speed
	if is_instance_valid(addition_ammo_label):
		addition_ammo_label.text = "Addition Ammo: %d" % player_node.additional_attacks
	if is_instance_valid(exp_label):
		exp_label.text = "Exp Amount Per Unit: %d" % (player_node.exp_bonus + 1)
	# ตรวจสอบ camera label - แก้ไขตรงนี้
	if is_instance_valid(camera_label):
		if main and main.has_node("Player/Camera2D"):  # ใช้ path ที่ถูกต้อง
			var cam = main.get_node("Player/Camera2D")
			camera_label.text = "Camera Zoom: %s" % str(cam.zoom)
		else:
			camera_label.text = "Camera Zoom: N/A"
	
	visible = true
	get_tree().paused = true

func _on_resume_pressed():
	resume_button.disabled = true
	exit_button.disabled = true
	$ClickSound.play()
	await $ClickSound.finished
	visible = false
	get_tree().paused = false  # เล่นเกมต่อ
	resume_button.disabled = false
	exit_button.disabled = false

func _on_exit_button_pressed() -> void:
	resume_button.disabled = true
	exit_button.disabled = true
	$ClickSound.play()
	await $ClickSound.finished
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/startgame.tscn")
