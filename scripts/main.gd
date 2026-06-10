extends Node2D
@export_group("Nodes", "")
@export var GameOverOverlay: Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameOverOverlay.visible = false
	GameOverOverlay.modulate.a = 0
	pass # Replace with function body.

func game_over():
	GameOverOverlay.visible = true
	# crear tween que también sobreviva al pause
	var tween = create_tween()
	tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)  # el tween sigue corriendo aunque el árbol esté pausado
	tween.tween_property(GameOverOverlay, "modulate:a", 1.0, 0.5)
	# ahora sí pausamos todo lo demás
	get_tree().paused = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Si la pelota entra en este area GO
func _on_game_over_area_body_entered(body: Node2D) -> void:
	self.game_over()
	pass # Replace with function body.


func _on_retry_button_button_up() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.
