extends Area2D

@onready var im_car: AudioStreamPlayer = $"im car"

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("click"):
		im_car.play()
