extends GameState

@export var simulate_attacks_state: GameState
#@export var pause_state: GameState
@onready var card_reference: Control


func enter() -> void:
	card_reference = parent.combo.pop_front()
	Events.parsed_card.emit(card_reference.move_index, card_reference.move_attributes)
	parent.isAnimationFinished = false

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	return simulate_attacks_state
  
