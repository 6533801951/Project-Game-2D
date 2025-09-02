extends CharacterBody2D

@export var speed: float = 50.0
@export var max_hp: int = 1
@export var damage: int = 1
var hp: int
var Player: Node2D = null
@export var drop_exp_scene: PackedScene = preload("res://scenes/exp_item.tscn")
var score_value: int = 1   # ค่าเริ่มต้น

func _ready():
	var mob_types = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_types.pick_random()
	$AnimatedSprite2D.play()
	hp = max_hp
	$dead_animation.hide()
	
func _physics_process(delta: float) -> void:
	if Player:
		var direction = (Player.global_position - global_position).normalized()
		velocity = direction * speed
		
		var collision = move_and_collide(velocity * delta)
		if collision:
			var body = collision.get_collider()
			if body.is_in_group("Player"):
				body.take_damage(damage)
				
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true 

func take_damage(amount: int) -> void:
	hp -= amount
	var popup_scene = preload("res://scenes/damage_popup.tscn")
	var popup = popup_scene.instantiate()
	get_tree().current_scene.add_child(popup)
	popup.show_damage(amount, global_position + Vector2(0, -10)) # แสดงเหนือหัวศัตรู
	if hp <= 0:
		$AnimatedSprite2D.hide()
		$EnemyDeadSound.play()
		$dead_animation.show()
		$dead_animation.play("default")
		$dead_animation.animation_finished.connect(die)
		
func die() -> void:
	if drop_exp_scene != null:
		call_deferred("_spawn_exp")
	# เพิ่มคะแนนแบบ deferred ก็ได้ (ถ้าเรียกตรง ๆ ไม่เกิด error)
	call_deferred("_add_score")
	# ลบ mob แบบ deferred
	call_deferred("queue_free")
	
func _spawn_exp():
	if drop_exp_scene != null:
		var exp_instance = drop_exp_scene.instantiate()
		exp_instance.global_position = global_position
		get_parent().add_child(exp_instance)

func set_score_value(value: int):
	score_value = value
	
func _add_score():
	if get_tree().current_scene.has_method("add_score"):
		get_tree().current_scene.add_score(score_value)
		
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		body.take_damage(1) 
