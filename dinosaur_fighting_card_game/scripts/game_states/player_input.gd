extends GameState

@export var parse_card_state: GameState

func enter() -> void:
	parent.isPlayer = true
	#parent.combo = %PlayerComboBoxContainer.combo_hand
	parent.is_enemy_turn = false
	#instantiate new cards?

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	if parent.isHandPlayed:
		return parse_card_state
	return null
