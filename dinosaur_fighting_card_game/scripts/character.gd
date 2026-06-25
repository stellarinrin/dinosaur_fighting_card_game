class_name Character
extends Node2D
signal damaged
signal attack_blocked

@export var attributes : CharacterAttributes

func _process(delta: float) -> void:
	if attributes.is_crouching:
		$Sprite2D.texture = load("res://assets/character-dinosaur-test-crouching.png")
	else:
		$Sprite2D.texture = load("res://assets/character-dinosaur-test-standing.png")

func player_hit(move: Card) -> void:
	# Safety check for card type
	if not move.move_type == Global.MoveType.ATTACK:
		return 
	if move.attack_level == Global.AttackLevel.UNBLOCKABLE:
		attributes.h_p -= move.damage
		damaged.emit()
		return
		
	match attributes.block_level:
		Global.BlockLevel.NONE:
			attributes.h_p -= move.damage
			damaged.emit()
			return
		Global.BlockLevel.LOW:
			if move.attack_level == Global.AttackLevel.HIGH or \
					move.attack_level == Global.AttackLevel.AIR:
				attributes.h_p -= move.damage
				damaged.emit()
				return
		Global.BlockLevel.HIGH:
			if move.attack_level == Global.AttackLevel.LOW:
				attributes.h_p -= move.damage
				damaged.emit()
				return
		Global.BlockLevel.AIR:
			if not move.attack_level == Global.AttackLevel.AIR:
				attributes.h_p -= move.damage
				damaged.emit()
				return
	attack_blocked.emit()
	
