extends GameState

@export var parse_card_state: GameState

func enter() -> void:
	parent.isPlayer = false
	parent.combo = %EnemyComboBoxContainer.combo_hand
	parent.is_enemy_turn = true
	parent.isHandPlayed = true
	#instantiate new cards?

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	if parent.isHandPlayed:
		return parse_card_state
	return null
