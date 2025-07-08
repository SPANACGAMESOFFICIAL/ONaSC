extends Control

@onready var animation_player: AnimationPlayer = $fader/ColorRect/AnimationPlayer
@onready var transition: Timer = $transition

func _ready():
	animation_player.play("fade out")

func _on_transition_timeout() -> void:
	get_tree().change_scene_to_file("res://other screens/main_menu.tscn")
