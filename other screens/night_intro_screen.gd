extends Control

@onready var timer_night_1: Timer = $"timer night 1"
@onready var timer_text_2: Timer = $"timer text 2"
@onready var timer_text_3: Timer = $"timer text 3"
@onready var master_timer: Timer = $"master timer"

@onready var fadeout_night_1: ColorRect = $"fadeout night 1"
@onready var fadeout_text_2: ColorRect = $"fadeout text 2"
@onready var fadeout_text_3: ColorRect = $"fadeout text 3"
@onready var master_fadeout: ColorRect = $"master fadeout"


@onready var animation_night_1: AnimationPlayer = $"fadeout night 1/animation night 1"
@onready var animation_text_2: AnimationPlayer = $"fadeout text 2/animation text 2"
@onready var animation_text_3: AnimationPlayer = $"fadeout text 3/animation text 3"
@onready var master_of_puppets: AnimationPlayer = $"master fadeout/master of puppets"

func _ready() -> void:
	animation_night_1.play("fade")
	fadeout_text_2.visible = true
	fadeout_text_3.visible = true
	master_fadeout.visible = false

func _on_timer_night_1_timeout() -> void:
	timer_text_2.start()
	fadeout_text_2.visible = true
	animation_text_2.play("fadeout again")
	
func _on_timer_text_2_timeout() -> void:
	timer_text_3.start()
	fadeout_text_3.visible = true
	animation_text_3.play("yet another fadeout again")
	

func _on_timer_text_3_timeout() -> void:
	master_timer.start()
	master_fadeout.visible = true
	master_of_puppets.play("master fade")
	

func _on_master_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://nights/1.tscn")
