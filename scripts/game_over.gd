extends Control

@onready var time_label = $timer_label
@onready var score_label = $score_label

func _ready():
	var minutes = int(GameData.final_time / 60)
	var seconds = int(GameData.final_time) % 60
	time_label.text = "Time: %02d:%02d" % [minutes, seconds]
	score_label.text = "Score: %d" % GameData.final_score
	$RetryButton.pressed.connect(_on_restart_pressed)

func _on_restart_pressed():
	$RetryButton.disabled = true
	$CloseButton.disabled = true
	# โหลด Scene หลักของเกม (ปรับ path ให้ตรง)
	$ClickSound.play()
	await $ClickSound.finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_close_button_pressed() -> void:
	$RetryButton.disabled = true
	$CloseButton.disabled = true
	$ClickSound.play()
	await $ClickSound.finished
	get_tree().change_scene_to_file("res://scenes/startgame.tscn")
