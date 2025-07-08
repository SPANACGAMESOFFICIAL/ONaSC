extends Area2D

@onready var burp: AudioStreamPlayer = $burp

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		burp.play()
