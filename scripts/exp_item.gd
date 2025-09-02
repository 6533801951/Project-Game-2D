extends Area2D

@export var exp_amount: int = 1

func _on_body_entered(body):
	if body.is_in_group("Player"):
		if body.has_method("gain_exp"):
			var final_exp = exp_amount + body.exp_bonus
			body.gain_exp(final_exp)
		queue_free()
