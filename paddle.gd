extends CharacterBody2D

@export var speed: float = 1500.0

func _process(delta: float) -> void:
	var direction := 0.0
	if Input.is_action_pressed("ui_left"):
		direction -= 1.0
	if Input.is_action_pressed("ui_right"):
		direction += 1.0
	   
	position.x += direction * speed * delta
	position.x = clamp(position.x, 150, 1080 - 150)
