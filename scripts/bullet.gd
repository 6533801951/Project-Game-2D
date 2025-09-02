extends Area2D

@export var speed: float = 300.0
@export var damage: int = 1
var direction: Vector2 = Vector2.ZERO

func set_direction(dir: Vector2):
	direction = dir

func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		position += direction * speed * delta
		
func _on_body_entered(body: Node) -> void:
	if body.has_method("take_damage"):
		body.take_damage(damage)
	queue_free() # กระสุนหายไปเมื่อชน
