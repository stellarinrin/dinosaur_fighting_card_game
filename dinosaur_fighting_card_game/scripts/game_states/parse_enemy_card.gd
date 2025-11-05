extends GameState

@export var parse_enemy_card_state : GameState
@export var transition_to_player : GameState
#@export var pause_state: GameState
@onready var card_reference: Control

func enter() -> void:
	card_reference = parent.combo.front()
	if card_reference:
		Events.parsed_enemy_card.emit(card_reference.move_index)
	
func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	if not parent.combo.front():
		return transition_to_player
	return null
 
func on_cancellable() -> GameState:
	parent.combo.pop_front()
	if not parent.combo.front():
		return transition_to_player
	return parse_enemy_card_state
