## Main controller for battle levels
class_name Level
extends Control

# to do list:
# - how to handle animations and speed ties
# - how to handle falling
# - wakeup phase
# - opponent AI
# - Card spawning/ hands / decks

## Signals *down* to player controllers to trigger combo execution
signal cards_played

## Primary game states/phases
enum GameState {
	NEUTRAL,
	NEUTRAL_P1,
	NEUTRAL_P2,
	ADVANTAGE,
	WAKEUP,
}

@export var game_state : Level.GameState = Level.GameState.NEUTRAL
@export var player_1 : Character
@export var player_2 : Character
@export var controller_1 : PlayerController
@export var controller_2 : PlayerController

## Base duration in seconds of each character action
@export var move_duration : float = 1

## Stores dimensions of the game's simulated grid
var grid_space : Vector2

## The current player set to take Advantage
var advantage_player : PlayerController

## Stores the check for the end of an Advantage combo executed 
##  within a player controller
var is_combo_broken : bool = false

func _ready() -> void:
	# Hide player inputs
	controller_1.hide_cards()
	controller_2.hide_cards()
	
	# Set initial game state
	set_state(game_state)
	
	# Cut screen into a grid
	grid_space.x = get_viewport_rect().size.x / 12
	grid_space.y = get_viewport_rect().size.y / 6.75
	
	# Set character initial positions
	player_1.position.x = grid_space.x * player_1.attributes.grid_position.x 
	player_1.position.y = -1 * grid_space.y * player_1.attributes.grid_position.y
	player_2.position.x = grid_space.x * player_2.attributes.grid_position.x 
	player_2.position.y = -1 * grid_space.y * player_2.attributes.grid_position.y 

func _process(delta: float) -> void:
	# Update and animate character sprite position based on new grid position
	player_1.position.x = lerp(player_1.position.x, 
			grid_space.x * player_1.attributes.grid_position.x, 22 * delta) 
	player_1.position.y = lerp(player_1.position.y, 
			-1 * grid_space.y * player_1.attributes.grid_position.y, 22 * delta)
	player_2.position.x = lerp(player_2.position.x, 
			grid_space.x * player_2.attributes.grid_position.x, 22 * delta)
	player_2.position.y = lerp(player_2.position.y, 
			-1 * grid_space.y * player_2.attributes.grid_position.y, 22 * delta)

func set_state(new_state: Level.GameState):
	match new_state:
		# Neutral Phase:
		Level.GameState.NEUTRAL:
			# Lock player inputs
			controller_1.lock_inputs()
			controller_2.lock_inputs()
			
			# Show player inputs
			controller_1.show_cards()
			controller_2.show_cards()
			
			# Execute player inputs
			#Check which move is faster and delay the slower one (or maybe use startup frames as a multiplier?)
			cards_played.emit()
			
			# Wait until both player's moves have been played
			await get_tree().create_timer(move_duration).timeout
			
			# Hide player inputs
			controller_1.hide_cards()
			controller_2.hide_cards()
			await get_tree().create_timer(move_duration).timeout #hiding animation?
			
			# Draw up to six cards
			
			# Transition to Advantage if there is a player in advantage
			if advantage_player:
				game_state = Level.GameState.ADVANTAGE
			# Transition to back to Neutral otherwise
			else:
				game_state = Level.GameState.NEUTRAL_P1
			set_state(game_state)

		# Neutral Phase Player 1:
		Level.GameState.NEUTRAL_P1:
			# Show Player 1's hand
			controller_1.show_cards()
			
			# Set combo length to 1 (what about fast fall?)
			controller_1.combo_length_limit = 1
			
			# Unlock player 1 input
			controller_1.unlock_inputs()
			# -*Persistent movement cards?
			
			# Game remains in this state until player submission is
			#  signalled up by the submission button

		# Neutral Phase PLayer 2:
		Level.GameState.NEUTRAL_P2:
			# Show Player 2's hand
			controller_2.show_cards()
			
			# Set combo length to 1 (what about fast fall?)
			controller_2.combo_length_limit = 1
			
			# Unlock player 2 input
			controller_2.unlock_inputs()
			# -*Persistent movement cards
			# Add cards to box (animate?)
			#**Rememeber to lock player 1's mouse**
			await get_tree().create_timer(move_duration).timeout
			
			# Submit
			
			# Lock player 2 input
			controller_1.lock_inputs()
			
			# Hide hand
			controller_1.hide_cards()
			
			# Transition to Neutral
			game_state = Level.GameState.NEUTRAL
			set_state(game_state)
			
		# Advantage:
		Level.GameState.ADVANTAGE:
			# Show advantage player's hand
			advantage_player.show_cards()
			
			# Set combo length to 6 (what about fast fall?)
			advantage_player.combo_length_limit = 6
			
			# Unlock player X input
			advantage_player.unlock_inputs()
			# -*Persistent movement cards
			
			# If the player in advantage is Player 1, the game remains 
			#  in this state until the player submission is signalled up 
			#  by the submission button
			if advantage_player == controller_1:
				return
			
			
			# ---The following is now for Player 2 AI---
			
			# Add cards to box (animate?)
			#**Rememeber to lock player 1's mouse**
			await get_tree().create_timer(move_duration).timeout
			
			# Submit
			
			# Lock player 2 input
			advantage_player.lock_inputs()
			
			# Execute card inputs
			cards_played.emit()
			
			# Is combo ended/broken?
			if is_combo_broken:
				# Hide hand
				advantage_player.hide_cards()
				#for now transition to neutral, but remember to account for WAKEUP phase
				advantage_player = null
				game_state = Level.GameState.NEUTRAL
			else:
				game_state = Level.GameState.ADVANTAGE
			set_state(game_state)

# When Player 1 submits their hand:
func _on_play_hand_pressed() -> void:
	match game_state:
		# Transition to Player 2's neutral state after hand submission
		Level.GameState.NEUTRAL_P1:
			game_state = Level.GameState.NEUTRAL_P2
		# Transition to 
		Level.GameState.ADVANTAGE:
			# This button does nothing if the player is not Player 1
			if advantage_player == controller_2:
				return
			# Reset to Neutral if combo has been broken
			#  in the previous advantage state
			if is_combo_broken:
				advantage_player = null
				game_state = Level.GameState.NEUTRAL
			# Execute card inputs otherwise and continue Advantage
			else:
				cards_played.emit()
		# This button does nothing if the game is none of the above states
		_:
			return
			
	# Lock player 1 input
	controller_1.lock_inputs()
	
	# Hide hand
	controller_1.hide_cards()
	
	# Repeat Advantage if combo was not broken in the previous Advantage cycle
	set_state(game_state)


# These four* functions update which player would have advantage in the
#  following turn. The last attack of a given phase will determine this.

# If the last attack is blocked, the blocking opponent gains advantage
func _on_player_1_block() -> void:
	advantage_player = controller_1
func _on_player_2_block() -> void:
	advantage_player = controller_2
	
# If the last attack damages the opponent, the attacker gains advantage
func _on_player_1_damaged() -> void:
	advantage_player = controller_2
func _on_player_2_damaged() -> void:
	advantage_player = controller_1

# If a player is thrown, the game resets to neutral UNLESS:
#   a thrown player lands against the wall, in which case the thrower gains advantage
func _on_player_1_thrown() -> void:
	advantage_player = controller_2
func _on_player_2_thrown() -> void:
	advantage_player = controller_1
func _on_player_1_wallbounced() -> void:
	advantage_player = controller_2
func _on_player_2_wallbounced() -> void:
	advantage_player = controller_1
