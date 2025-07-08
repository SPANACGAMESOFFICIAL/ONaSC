extends CanvasLayer

@onready var tv_static: AnimatedSprite2D = $static
@onready var animation_player: AnimationPlayer = $cioran/AnimationPlayer
@onready var cioran: Sprite2D = $cioran
@onready var this_guy_stinks: AudioStreamPlayer = $"this guy stinks"
@onready var moonlight_sonata: AudioStreamPlayer = $"moonlight sonata"
@onready var awww: AudioStreamPlayer = $awww

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.stop()
	cioran.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_static_fade_out_timeout() -> void:
	cioran.visible = true
	animation_player.play("fade in")
	moonlight_sonata.play()
	awww.play()

func _on_back_to_the_menu_timeout() -> void:
	get_tree().change_scene_to_file("res://other screens/main_menu.tscn")


func _on_this_guy_timer_timeout() -> void:
	this_guy_stinks.play()
