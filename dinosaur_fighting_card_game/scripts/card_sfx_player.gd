extends AudioStreamPlayer2D
@export var card_hover_sound : AudioStream
@export var card_grab_sound : AudioStream
@export var card_drop_sound : AudioStream
@onready var is_grabbed : bool = false

func _on_card_mouse_entered() -> void:
	stream = card_hover_sound
	play()


func _on_card_resized() -> void:
	if is_grabbed:
		stream = card_drop_sound
		play()
		is_grabbed = false
	else:
		#stream = card_grab_sound
		#play()
		is_grabbed = true
