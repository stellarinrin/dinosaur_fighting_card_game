extends AudioStreamPlayer2D

@export var button_hover_sound : AudioStream
@export var reset_button_click_sound : AudioStream
@export var play_button_click_sound : AudioStream
@export var button_click_sound : AudioStream

@export var turn_notification_sound : AudioStream
@export var health_depletion_sound : AudioStream


func _on_hud_animation_change(animation: String) -> void:
	if animation == "player_notification" or animation == ("enemy_notification"):
		stream = turn_notification_sound
		play()


func _on_button_hover() -> void:
	stream = button_hover_sound
	play()
	
func _on_reset_cards() -> void:
	stream = reset_button_click_sound
	play()

func _on_play_cards() -> void:
	stream = play_button_click_sound
	play()

func _on_button_pressed() -> void:
	stream = button_click_sound
	play()
