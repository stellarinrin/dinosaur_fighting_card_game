class_name PlayerState
extends Node

@export var animation_name: String
@export var move_speed: float = 300

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

# Hold a reference to the parent so that it can be controlled by the state
var parent: CharacterBody2D

func enter() -> void:
	parent.animations.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> PlayerState:
	return null

func process_frame(delta: float) -> PlayerState:
	return null

func process_physics(delta: float) -> PlayerState:
	return null
