extends AudioStreamPlayer

@onready var static_fade_out: Timer = $"../static fade out"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if static_fade_out.time_left >= 1.0:
		volume_db = 1.0
	else:
		volume_db -= static_fade_out.time_left
