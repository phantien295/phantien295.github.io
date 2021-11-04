extends Area2D

var FIREWORK = preload("res://effects/Firework.tscn")

func _ready() -> void:
	set_process_input(true)

func _on_PresentBox_mouse_entered() -> void:
	$Sprite.set_frame(1)

func _on_PresentBox_mouse_exited() -> void:
	$Sprite.set_frame(0)

func _on_PresentBox_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		var firework = FIREWORK.instance()
		firework.position = Vector2(0, -15)
		add_child(firework)
		# Play audio
		var player = get_parent().get_parent().get_node("AudioStreamPlayer")
		if !player.is_playing():
			player.play()

		var tween = get_parent().get_node("Tween")
		tween.interpolate_property(
			get_parent().get_node("PresentBox/Light"), "scale", Vector2(3, 3), Vector2(0, 0), 2, Tween.TRANS_CIRC, Tween.EASE_IN_OUT
		)
		tween.interpolate_property(
			get_parent(), "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2, Tween.TRANS_CIRC, Tween.EASE_IN_OUT
		)
		tween.start()
		"""
		var tween = get_parent().get_node("Tween")
		tween.interpolate_property(
			get_parent(), "rect_scale", Vector2(1, 1), Vector2(0, 0), 2, Tween.TRANS_CIRC, Tween.EASE_IN_OUT
		)
		tween.start()
		"""
		# Start timer
		get_parent().get_parent().get_node("Timer").start()

func _on_Tween_tween_all_completed() -> void:
	get_parent().queue_free()
