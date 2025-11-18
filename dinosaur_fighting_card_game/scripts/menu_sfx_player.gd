extends AudioStreamPlayer2D

@export var menu_open_sound : AudioStream
@export var menu_close_sound  : AudioStream
@export var button_hover_sound : AudioStream
@export var logo_pop_in_1 : AudioStream
@export var logo_pop_in_2 : AudioStream
@export var logo_pop_in_3 : AudioStream


func _on_level_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		stream = menu_open_sound
		play()
	else:
		stream = menu_close_sound
		play()


func _on_level_button_mouse_entered() -> void:
	stream = button_hover_sound
