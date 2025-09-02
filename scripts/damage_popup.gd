extends Label

func show_damage(amount: int, position: Vector2):
	text = str(amount)
	global_position = position
	
	# ทำให้มันลอยขึ้นและจางหาย
	var tween = create_tween()
	tween.tween_property(self, "position:y", position.y - 30, 0.6).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "modulate:a", 0.0, 0.6)  # ค่อยๆ หายไป
	tween.finished.connect(queue_free)
