extends Area2D

@onready var im_a_genius: AudioStreamPlayer = $"im a genius"

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		im_a_genius.play()
