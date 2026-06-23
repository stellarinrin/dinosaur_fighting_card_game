class_name PlayerController
extends Control

var card 
var combo
@export var is_active : bool = false

@onready var container = $HBoxContainer
@export var combo_length_limit : int = 5
@export var player : Character
@export var opponent : Character
var combo_length : int = 0

func _process(_delta: float) -> void:
	# Locks card in place
	if (container.get_child_count(true) > 0):
		container.get_child(0)._set_rotation(0)
	container.queue_sort()

func _on_combo_box_entered(area: Area2D) -> void:
	if not is_active:
		return
	# Adds cards to box
	if area.get_parent() is not Card:
		return
	card = area.get_parent()
	combo_length = $HBoxContainer.get_child_count()
	if combo_length >= combo_length_limit:
		return
	card.reparent(container)
	
# check startup speed to see which action goes first
func execute_moves() -> void:
	combo = container.get_children()
	#delay if speed tie is lost; attacks need to be calculated with the opponent's final distance if the movement is faster
	for move in combo:
		print(combo)
		match move.move_type:
			Global.MoveType.MOVEMENT:
				character_move(move, player, opponent)
			Global.MoveType.ATTACK:
				character_attack(move, player, opponent)
			Global.MoveType.BLOCK:
				character_block(move, player, opponent)
			Global.MoveType.THROW:
				character_throw(move, player, opponent)
		await get_tree().create_timer(1).timeout
		#move.queue_free()
	combo.clear()

func hide_cards() -> void:
	$ComboBox.visible = false
	$HBoxContainer.visible = false
	
func show_cards() -> void:
	$ComboBox.visible = true
	$HBoxContainer.visible = true
	
func lock_inputs() -> void:
	# Disable inputs
	is_active = false
	#animation?
	
func unlock_inputs() -> void:
	#animation?
	# Disable inputs
	is_active = true
	
func character_move(move: Card, player: Character, opponent: Character) -> void:
	if player.attributes.grid_position.y == 0 or true: # only if the character is grounded
		player.attributes.grid_position.x += move.horizontal_distance
		player.attributes.grid_position.y += move.vertical_distance
	
func character_attack(move: Card, player: Character, opponent: Character) -> void:
	var hitbox : Vector2 = player.attributes.grid_position + move.hitbox
	# Characters will auto-turn to hit their move
	if (opponent.attributes.grid_position.x > player.attributes.grid_position.x \
			and opponent.attributes.grid_position.x <= \
			player.attributes.grid_position.x + move.hitbox.x) or \
			(opponent.attributes.grid_position.x < player.attributes.grid_position.x \
			and opponent.attributes.grid_position.x >= \
			player.attributes.grid_position.x - move.hitbox.x):
		# If the opponent is at the same height as the player or if they are *standing* at eye 
		#	level with the player's bottom half, allow the hit
		if opponent.attributes.grid_position.y == player.attributes.grid_position.y \
				or (opponent.attributes.grid_position.y + 1 == player.attributes.grid_position.y \
				and not opponent.attributes.is_crouching):
			opponent.attributes.h_p -= 10.0
		# If the opponent is higher than the player, check if the move points up
		elif (opponent.attributes.grid_position.y >= player.attributes.grid_position.y) \
				and (move.hitbox.y > 0) and (opponent.attributes.grid_position.y <= \
				player.attributes.grid_position.y + move.hitbox.y):
			opponent.attributes.h_p -= 10.0
		# If the opponent is lower than the player, check if the move points down
		elif (opponent.attributes.grid_position.y <= player.attributes.grid_position.y) \
				and (move.hitbox.y < 0) and (opponent.attributes.grid_position.y >= \
				player.attributes.grid_position.y + move.hitbox.y):
			opponent.attributes.h_p -= 10.0
	

func character_block(move: Card, player: Character, opponent: Character) -> void:
	pass

func character_throw(move: Card, player: Character, opponent: Character) -> void:
	pass
