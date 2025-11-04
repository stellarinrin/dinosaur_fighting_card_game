extends GameState

@export var parse_player_card_state: GameState

func enter() -> void:
	#instantiate new cards?
	return

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	if parent.is_hand_played:
		parent.combo = %PlayerComboBoxContainer.combo_hand
		return parse_player_card_state
	return null
