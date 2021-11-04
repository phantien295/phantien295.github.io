extends Node2D

func _ready() -> void:
	$CPUParticles2D.one_shot = true
	$CPUParticles2D.emitting = true
	$Tween2.interpolate_property($Light2D, "scale", Vector2(0, 0), Vector2(9.5, 9.5), 1, Tween.TRANS_CIRC, Tween.EASE_OUT_IN)
	$Tween2.start()


func _on_Timer_timeout() -> void:
	$Tween.interpolate_property($Light2D, "scale", Vector2(9.5, 9.5), Vector2(0, 0), 1, Tween.TRANS_CIRC, Tween.EASE_IN_OUT)
	$Tween.start()


func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	queue_free()
