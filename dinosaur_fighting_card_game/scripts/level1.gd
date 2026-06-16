extends Control
class_name Level


@export var player_1 : Character
@export var player_2 : Character

var combo : Array = []
@export var combo_box_1 : Control
@export var combo_box_2 : Control
var grid_space : Vector2

func _ready() -> void:
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

func _on_play_hand_pressed() -> void:
	#maybe put this part in its own function when programming turn cycle
	var player : Character = player_1
	var opponent : Character = player_2
	
	combo = combo_box_1.container.get_children()
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
	combo.clear()
	
	
func character_move(move: Card, player: Character, opponent: Character) -> void:
	if player.attributes.grid_position.y == 0 or true: # only if the character is grounded
		player.attributes.grid_position.x += move.horizontal_distance
		player.attributes.grid_position.y += move.vertical_distance
	
func character_attack(move: Card, player: Character, opponent: Character) -> void:
	opponent.attributes.h_p -= 10.0

func character_block(move: Card, player: Character, opponent: Character) -> void:
	pass

func character_throw(move: Card, player: Character, opponent: Character) -> void:
	pass
