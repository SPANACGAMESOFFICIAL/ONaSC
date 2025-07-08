extends Node2D

@onready var enemy: Sprite2D = $enemy
@onready var appearence_time: Timer = $"enemy/appearence time"
@onready var kill_time: Timer = $"enemy/kill time"
@onready var door_animation: AnimationPlayer = $door/AnimationPlayer
@onready var doors_button: Button = $"doors button"
@onready var door: Sprite2D = $door
@onready var power_timer: Timer = $"power timer"
@onready var power_left: ProgressBar = $"ui/power left"
@onready var enemy_jumpscare: AnimationPlayer = $enemy/AnimationPlayer
@onready var power_out_timer: Timer = $"power out timer"
@onready var jumpscare_timer: Timer = $"jumpscare timer"
@onready var funy_jumpscare_haha: AudioStreamPlayer = $"enemy/funy jumpscare haha"
@onready var door_sound: AudioStreamPlayer = $"door sound"
@onready var carlos: AudioStreamPlayer = $carlos
@onready var skip_call: Button = $"skip call"
@onready var hang_up_call: AudioStreamPlayer = $"hang up call"
@onready var kitty_run: AudioStreamPlayer = $"kitty run"
@onready var shutting_down: AudioStreamPlayer = $"shutting down"
@onready var music: AudioStreamPlayer = $music
@onready var powering_down: AudioStreamPlayer = $"powering down"
@onready var power_filter: ColorRect = $"power filter"
@onready var power_filter_animations: AnimationPlayer = $"power filter/power filter animations"
@onready var backrooms: AudioStreamPlayer = $backrooms

var door_is_closed
var change_state

func change_to_death_screen():
	get_tree().change_scene_to_file("res://other screens/game_over.tscn")

func change_to_win_screen():
	get_tree().change_scene_to_file("res://other screens/6_am.tscn")

func doors_closed():
	door_animation.play("closing")
	power_timer.start()
	door_sound.play()
func doors_open():
	door_animation.play("opening")
	power_timer.stop()
	door_sound.play()
func power_out():
	doors_button.disabled = true
	door_animation.play("opening")
	door_is_closed = false
	print("Your power ran out")
	power_left.visible = false
	power_out_timer.start()
	shutting_down.play()
	music.stop()
	carlos.stop()
	backrooms.queue_free()
	power_filter.visible = true
	powering_down.play()
	skip_call.queue_free()
	doors_button.queue_free()
	power_filter_animations.play("power_down")
	kill_time.wait_time = 0.2
func door_state_change():
	if door_is_closed == true:
		change_state = false
	else:
		change_state = true

func _ready() -> void:
	power_filter.visible = false
	power_left.max_value = 3
	enemy.visible = false
	door_is_closed = false
	appearence_time.wait_time = randi_range(5,10)

func _process(delta: float) -> void:
	power_left.value = power_timer.time_left
	if power_left.value == 0:
		power_left.value = 100
	if change_state == true:
		if door_is_closed == true:
			door_animation.play("opening")
		elif door_is_closed == false:
			door_animation.play("closing")
		change_state = false

func _on_appearence_time_timeout() -> void:
	enemy.visible = true
	enemy_jumpscare.play("appearence")
	kill_time.start()
	kill_time.wait_time = 2

func _on_kill_time_timeout() -> void:
	if door_is_closed == false:
		print("You died")
		door.visible = false
		enemy_jumpscare.play("jumpscare")
		funy_jumpscare_haha.play()
		jumpscare_timer.start()
	else:
		print("You survived")
		kitty_run.play()
		enemy.visible = false
		
	kill_time.stop()

func _on_doors_button_pressed() -> void:
	door_is_closed = !door_is_closed
	if door_is_closed == true:
		doors_closed()
	if door_is_closed == false:
		doors_open()
	

func _on_power_timer_timeout() -> void:
	power_out()

	
func _on_clock_until_6_am_timeout() -> void:
	print("You won!")
	change_to_win_screen()

func _on_power_out_timer_timeout() -> void:
	pass

func _on_jumpscare_timer_timeout() -> void:
	change_to_death_screen()


func _on_skip_call_pressed() -> void:
	carlos.stop()
	skip_call.disabled = true
	hang_up_call.play()


func _on_carlos_finished() -> void:
	skip_call.disabled = true


func _on_backrooms_finished() -> void:
	backrooms.play()
