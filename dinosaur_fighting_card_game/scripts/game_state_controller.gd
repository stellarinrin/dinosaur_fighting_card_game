class_name GameStateController extends Node2D

enum GameState {
	PLAYER_TURN,
	PLAYER_ACTION,
	#ENEMY_TURN,
	ENEMY_ACTION,
	FAILURE,
	SUCCESS
}

@onready var current_state: GameState = GameState.PLAYER_TURN

func transition(next_state: GameState):

	match current_state:
		GameState.PLAYER_TURN:
			pass
		GameState.PLAYER_ACTION:
			pass
		GameState.ENEMY_ACTION:
			pass
		GameState.FAILURE:
			pass
		GameState.SUCCESS:
			pass
	
	current_state = next_state

	match current_state:
		GameState.PLAYER_TURN:
			pass
		GameState.PLAYER_ACTION:
			pass
		GameState.ENEMY_ACTION:
			pass
		GameState.FAILURE:
			pass
		GameState.SUCCESS:
			pass
