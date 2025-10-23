extends GameState

@export var parse_card_state: GameState

func enter() -> void:
	parent.is_enemy_turn = false
	#instantiate new cards?

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	if parent.is_hand_played:
		parent.combo = %PlayerComboBoxContainer.combo_hand
		return parse_card_state
	return null
