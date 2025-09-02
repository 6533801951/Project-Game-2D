extends Control

func _ready():
	# เมื่อกดปุ่มเริ่มเกม
	$StartGameSong.play()
	$StartButton.pressed.connect(_on_start_pressed)
	# เมื่อกดปุ่มออกเกม
	$CloseButton.pressed.connect(_on_close_pressed)

func _on_start_pressed():
	$StartButton.disabled = true
	$CloseButton.disabled = true
	# โหลด scene หลัก
	$ClickSound.play()
	await $ClickSound.finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_close_pressed():
	$StartButton.disabled = true
	$CloseButton.disabled = true
	# ปิดเกม
	$ClickSound.play()
	await $ClickSound.finished
	get_tree().quit()
