extends GameState

@export var player_input_state: GameState
@export var failure_state: GameState
@export var success_state: GameState
@export var parse_card_state: GameState
@export var enemy_input_state: GameState
#@export var pause_state: GameState


func enter() -> void:
	pass

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	# parse all cards
	if not parent.combo: # When there are no cards left
		parent.isHandPlayed = false
		if parent.isPlayer:
			return enemy_input_state #Let enemy input after player combo is ends
		return player_input_state
	if parent.isAnimationFinished: # Parse next card only when animation ends
		return parse_card_state
	return null
