extends GameState

@export var simulate_attacks_state: GameState
@export var parse_card_state : GameState
@export var player_input_state : GameState
@export var enemy_input_state : GameState
#@export var pause_state: GameState
@onready var card_reference: Control

func _ready() -> void:
	Events.cancellable.connect(cancellable.bind())

func enter() -> void:
	card_reference = parent.combo.front()
	Events.parsed_card.emit(card_reference.move_index)
	#parent.isAnimationFinished = false

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	return null
 
func cancellable() -> GameState:
	parent.combo.pop_front()
	if not parent.is_enemy_turn and not parent.combo.front():
		Events.switch_turn.emit()
		return enemy_input_state
	if parent.is_enemy_turn and not parent.combo.front():
		Events.switch_turn.emit()
		return player_input_state
	return parse_card_state
