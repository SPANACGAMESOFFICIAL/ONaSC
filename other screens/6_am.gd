extends CanvasLayer

@onready var animation_player: AnimationPlayer = $"the guy/AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("fade in")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_back_to_the_menu_baby_timeout() -> void:
	get_tree().change_scene_to_file("res://other screens/check.tscn")
