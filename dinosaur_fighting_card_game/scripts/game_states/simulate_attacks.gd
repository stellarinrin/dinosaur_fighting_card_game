extends GameState

@export var player_input_state: GameState
@export var failure_state: GameState
@export var success_state: GameState
@export var parse_card_state: GameState
#@export var pause_state: GameState


func enter() -> void:
	pass

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	if not parent.combo:
		parent.isHandPlayed = false
		return player_input_state
	if parent.isAnimationFinished:
		return parse_card_state
	return null
