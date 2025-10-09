extends CanvasLayer
@onready var is_menu_open: bool = false

func _on_visibility_changed() -> void:
	if visible:
		$AnimationPlayer.play("text_pop_in")
		if is_menu_open:
			$AnimationPlayer.play_backwards("text_pop_in")
		is_menu_open = true
	if not visible:
		is_menu_open = false
