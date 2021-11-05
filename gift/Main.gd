extends Panel

var loader

var FIREWORK = preload("res://effects/Firework.tscn")

func _ready() -> void:
	set_process_input(true)
	loader = ResourceLoader.load_interactive('res://Main.gd')

func _process(delta: float) -> void:
	$Count.text = '%d/%d' % [loader.get_stage(), loader.get_stage_count()]

func _input(event: InputEvent) -> void:
	# Set false to prevent left mouse is clicked
	if Input.is_mouse_button_pressed(BUTTON_LEFT) && false:
		var firework = FIREWORK.instance()
		firework.position = get_global_mouse_position()
		add_child(firework)


func _on_Timer_timeout() -> void:
	pass
	"""
	var textLight = $TextLight2D
	textLight.visible = true
	$Tween1.interpolate_property(textLight, "scale", Vector2(0, 0), Vector2(3, 3), 2, Tween.TRANS_CIRC, Tween.EASE_IN_OUT)
	$Tween1.repeat = false
	$Tween1.start()
	"""

func _on_Tween1_tween_completed(object: Object, key: NodePath) -> void:
	pass
	"""
	$Tween1.queue_free()

	$Tween2.interpolate_property($TextLight2D, "position", Vector2(325.532, 524.266), Vector2(704, 524.266), 10, Tween.TRANS_CIRC, Tween.EASE_IN_OUT)
	$Tween2.repeat = false
	$Tween2.start()
	"""

func _on_Tween2_tween_completed(object: Object, key: NodePath) -> void:
	pass
	"""
	$Tween2.queue_free()
	$TextLight2D.scale = Vector2(3, 3)
	$Tween3.interpolate_property($TextLight2D, "scale", Vector2(3, 3), Vector2(0, 0), 3, Tween.TRANS_CIRC, Tween.EASE_OUT_IN)
	$Tween3.repeat = false
	$Tween3.start()
	"""
