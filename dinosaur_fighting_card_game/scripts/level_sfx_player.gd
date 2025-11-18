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

#func _ready() -> void:
	#Events.parsed_player_card.connect(_on_parsed_card.bind())
	#Events.parsed_enemy_card.connect(_on_parsed_card.bind())
