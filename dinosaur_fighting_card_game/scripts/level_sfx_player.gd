extends AudioStreamPlayer2D

@export var card_hover_sound : AudioStream
@export var card_grab_sound : AudioStream
@export var card_drop_sound : AudioStream

@export var button_hover_sound : AudioStream
@export var reset_button_click_sound : AudioStream
@export var play_button_click_sound : AudioStream

@export var hit_sound : AudioStream
@export var block_sound : AudioStream
@export var set_up_block_sound : AudioStream

@export var turn_notification_sound : AudioStream
@export var health_depletion_sound : AudioStream

@export var swing_sound : AudioStream
@export var dash_sound : AudioStream

func _on_hurtbox_2d_damaged(_damage: float) -> void:
	await get_tree().create_timer(.3).timeout
	stream = hit_sound
	play()


func _on_hurtbox_2d_blocked() -> void:
	await get_tree().create_timer(.3).timeout
	stream = block_sound
	play()


func _on_hud_animation_change(animation: String) -> void:
	if animation == "player_notification" or animation == ("enemy_notification"):
		stream = turn_notification_sound
		play()
