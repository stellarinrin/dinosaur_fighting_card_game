class_name GameState
extends Node

## Hold a reference to the parent so that it can be controlled by the state
var parent: Node2D
var frame_count: int

func enter() -> void:
	frame_count = 0 #parent.animations.play(animation_name)

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	return null
