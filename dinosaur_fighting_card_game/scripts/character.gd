class_name Character
extends Node2D

@export var attributes : CharacterAttributes

func _process(delta: float) -> void:
	if attributes.is_crouching:
		$Sprite2D.texture = load("res://assets/character-dinosaur-test-crouching.png")
	else:
		$Sprite2D.texture = load("res://assets/character-dinosaur-test-standing.png")
