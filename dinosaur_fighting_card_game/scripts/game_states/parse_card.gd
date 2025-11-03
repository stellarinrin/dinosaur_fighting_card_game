extends GameState

@export var parse_card_state : GameState
@export var player_input_state : GameState
@export var enemy_input_state : GameState
#@export var pause_state: GameState
@onready var card_reference: Control

func enter() -> void:
	card_reference = parent.combo.front()
	if card_reference:
		Events.parsed_card.emit(card_reference.move_index)
	
func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	if not parent.is_enemy_turn and not parent.combo.front():
		Events.switch_turn.emit()
		parent.is_hand_played = false
		return enemy_input_state
	if parent.is_enemy_turn and not parent.combo.front():
		Events.switch_turn.emit()
		return player_input_state
	return null
 
func on_cancellable() -> GameState:
	parent.combo.pop_front()
	if not parent.is_enemy_turn and not parent.combo.front():
		Events.switch_turn.emit()
		parent.is_hand_played = false
		return enemy_input_state
	if parent.is_enemy_turn and not parent.combo.front():
		Events.switch_turn.emit()
		return player_input_state
	print(card_reference)
	return parse_card_state
