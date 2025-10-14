extends GameState

@export var parse_card_state: GameState

func enter() -> void:
	parent.isPlayer = false
	#instantiate new cards?

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	#if parent.isHandPlayed:
		#return parse_card_state
	#return null
	return parse_card_state
