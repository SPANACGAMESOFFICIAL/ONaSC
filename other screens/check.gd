extends Control

@onready var animation_player: AnimationPlayer = $fade/AnimationPlayer

func _ready() -> void:
	animation_player.play("fade")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://other screens/main_menu.tscn")
