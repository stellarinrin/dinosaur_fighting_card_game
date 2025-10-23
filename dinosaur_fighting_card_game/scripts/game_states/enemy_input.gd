extends GameState

@export var parse_card_state: GameState
@export var frames_before_enemy_play : int

func enter() -> void:
	super()
	parent.is_enemy_turn = true
	#instantiate new cards?

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	frame_count += 1
	if frame_count == frames_before_enemy_play:
		parent.combo = %EnemyComboBoxContainer.combo_hand
		return parse_card_state
	return null
