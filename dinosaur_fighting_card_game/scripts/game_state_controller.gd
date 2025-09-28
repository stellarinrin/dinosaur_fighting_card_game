extends Node

@export var starting_state: GameState
var current_state: GameState

## Initialise the state machine by giving each child state a reference to the
## parent object it belongs to and enter the default starting_state
func init(parent: Node2D) -> void:
	for child in get_children():
		child.parent = parent
	
	## Initialise to the default state
	change_state(starting_state)

## Change to the new state by first calling any exit logic on the current state
func change_state(new_state: GameState) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()
	
## Pass through functions for the Player to call,
## handling state changes as needed.
		
func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
		
