class_name PlayerState
extends Node

@export var animation_name: String
@export var gravity: int = 980

# Hold a reference to the parent so that it can be controlled by the state
var parent: CharacterBody2D

func enter() -> void:
	pass

func exit() -> void:
	pass

func _on_parsed_card(index: String, attributes: MoveAttributes, player: bool) -> PlayerState:
	return null
	
func process_frame(delta: float) -> PlayerState:
	return null

func process_physics(delta: float) -> PlayerState:
	return null
