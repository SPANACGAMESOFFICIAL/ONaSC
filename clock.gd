extends Label

var current_time

func update():
	set_text(str(current_time))
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_time = 12


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update()


func _on_time_counter_timeout() -> void:
	if current_time == 12:
		current_time = 1
	else:
		current_time += 1
