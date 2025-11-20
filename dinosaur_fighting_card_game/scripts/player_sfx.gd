extends AudioStreamPlayer2D
@export var hit_sound : AudioStream
@export var block_sound : AudioStream
@export var set_up_block_sound : AudioStream

@export var swing_sound : AudioStream
@export var dash_sound : AudioStream

func _on_hurtbox_2d_damaged(_damage: float) -> void:
	await get_tree().create_timer(.3).timeout
	stream = hit_sound
	play()

func _on_hit_blocked() -> void:
	await get_tree().create_timer(.3).timeout
	stream = block_sound
	play()

func _on_block() -> void:
	#await get_tree().create_timer(.3).timeout
	stream = set_up_block_sound
	play()
