extends CharacterBody2D


func _ready() -> void:
	pass
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
