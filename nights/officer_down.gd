extends Area2D

@onready var scream: AudioStreamPlayer = $scream

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		scream.play()
