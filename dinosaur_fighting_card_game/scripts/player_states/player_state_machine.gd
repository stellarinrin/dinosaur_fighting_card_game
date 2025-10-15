extends Node

@export var starting_state: PlayerState

var current_state: PlayerState
var parent_player : CharacterBody2D

# Initialize the state machine by giving each child state a reference to the
# parent object it belongs to and enter the default starting_state.
func init(parent: CharacterBody2D) -> void:
	for child in get_children():
		child.parent = parent
		
	parent_player = parent
	# Initialize to the default state
	change_state(starting_state)

# Change to the new state by first calling any exit logic on the current state.
func change_state(new_state: PlayerState) -> void:
	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter()
	
# Pass through functions for the Player to call,
# handling state changes as needed.
func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func _on_parsed_card(index: String, attributes: MoveAttributes, player: bool) -> void:
	if player != parent_player.isPlayer: # Don't play animations if not active character
		return
	var new_state = current_state._on_parsed_card(index, attributes, player)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
