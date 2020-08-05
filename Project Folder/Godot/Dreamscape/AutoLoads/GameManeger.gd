extends Node

var mouse_sensitivity = 0.2
var is_mouse_locked = false

func _process(delta):
	if is_mouse_locked:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
