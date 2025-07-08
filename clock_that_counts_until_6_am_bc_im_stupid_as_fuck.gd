extends Timer

@onready var time_counter: Timer = $"../time counter"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wait_time = time_counter.wait_time * 6


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
