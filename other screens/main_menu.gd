extends Control

@onready var sprite_2d: Sprite2D = $Sprite2D

var cursor_visibility

func check_cursor_visibility():
	if cursor_visibility == false:
		sprite_2d.visible = false
	else:
		sprite_2d.visible = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cursor_visibility = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_cursor_visibility()


func _on_area_2d_body_entered(body: Node2D) -> void:
	cursor_visibility = true



func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	cursor_visibility = false
