class_name PlayerState
extends Node

@export var animation_name: String
@export var gravity: int = 980
@export var cancel_frame: int = 0
var frame_count: int

var move_speed: float = 300
# Hold a reference to the parent so that it can be controlled by the state
var parent: CharacterBody2D

func enter() -> void:
	parent.animations.play(animation_name)
	parent.animations.seek(0)
	frame_count = 0

func exit() -> void:
	pass

#func _on_parsed_card(index: String, attributes: MoveAttributes, player: bool) -> PlayerState:
	#return null

func process_input(event: InputEvent) -> PlayerState:
	return null
		
func process_frame(delta: float) -> PlayerState:
	return null

func process_physics(delta: float) -> PlayerState:
	return null

func on_animation_finished(anim_name: StringName) -> PlayerState:
	return null
