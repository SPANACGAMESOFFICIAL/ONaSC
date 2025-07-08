extends Control

@onready var play_button: TextureButton = $TextureButton
@onready var daily_gooner: Sprite2D = $"daily gooner"
@onready var animation_player: AnimationPlayer = $"daily gooner/AnimationPlayer"
@onready var timer_for_transitioning_to_the_next_scene: Timer = $"timer for transitioning to the next scene"
@onready var fadeout_animation: AnimationPlayer = $"black for fade out/fadeout animation"
@onready var black_for_fade_out: ColorRect = $"black for fade out"
@onready var second_timer_because_i_am_a_retard: Timer = $"second timer because i am a retard"
@onready var tv_static: AnimatedSprite2D = $static
@onready var radio_static: AudioStreamPlayer = $"radio static"

func _ready() -> void:
	tv_static.play()
	daily_gooner.visible = false
	black_for_fade_out.visible = false
	pass


func _on_texture_button_pressed() -> void:
	daily_gooner.visible = true
	play_button.queue_free()
	tv_static.pause()
	radio_static.queue_free()
	animation_player.play("fade_in")
	timer_for_transitioning_to_the_next_scene.start()


func _on_timer_for_transitioning_to_the_next_scene_timeout() -> void:
	black_for_fade_out.visible = true
	fadeout_animation.play("fadeout")
	second_timer_because_i_am_a_retard.start()


func _on_second_timer_because_i_am_a_retard_timeout() -> void:
	get_tree().change_scene_to_file("res://other screens/night_intro_screen.tscn")



func _on_radio_static_finished() -> void:
	radio_static.play()
