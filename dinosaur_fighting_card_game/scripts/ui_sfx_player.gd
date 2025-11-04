extends AudioStreamPlayer2D

@export var button_click_sound : AudioStream
@export var button_hover_sound : AudioStream
@export var hit_sound : AudioStream
@export var swing_sound : AudioStream

func _ready() -> void:
	Events.parsed_player_card.connect(_on_parsed_card.bind())
	Events.parsed_enemy_card.connect(_on_parsed_card.bind())

func _on_parsed_card(index: int, attributes: MoveAttributes) -> void:
	stream = hit_sound
	play()


func _on_reset_cards_button_down() -> void:
	stream = button_click_sound
	play()


func _on_reset_cards_mouse_entered() -> void:
	stream = button_hover_sound
	play()


func _on_play_hand_button_down() -> void:
	stream = button_click_sound
	play()


func _on_play_hand_mouse_entered() -> void:
	stream = button_hover_sound
	play()



func _on_add_mid_card_button_down() -> void:
	stream = button_click_sound
	play()


func _on_add_mid_card_mouse_entered() -> void:
	stream = button_hover_sound
	play()



func _on_add_low_card_button_down() -> void:
	stream = button_click_sound
	play()


func _on_add_low_card_mouse_entered() -> void:
	stream = button_hover_sound
	play()
