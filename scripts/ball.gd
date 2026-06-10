extends CharacterBody2D

func _ready() -> void:
	# Velocidad inicial
	velocity.x = 200
	velocity.y = 200

func _physics_process(delta: float) -> void:
	
	# Movemos
	var collision = move_and_collide(self.velocity * delta)
	if collision != null:
		self.velocity = self.velocity.bounce(collision.get_normal())
