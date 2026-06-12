extends Control

@export var player_1 : Node2D
@export var player_2 : Node2D

var combo : Array = []
@export var combo_box_1 : Control
@export var combo_box_2 : Control
var grid_space : Vector2

func _ready() -> void:
	# Cut screen into a grid
	grid_space.x = get_viewport_rect().size.x / 12
	grid_space.y = get_viewport_rect().size.y / 6.75
	
func _process(delta: float) -> void:
	player_1.position.x = grid_space.x * player_1.attributes.grid_position.x 
	player_1.position.y = -1 * grid_space.y * player_1.attributes.grid_position.y
	player_2.position.x = grid_space.x * player_2.attributes.grid_position.x 
	player_2.position.y = -1 * grid_space.y * player_2.attributes.grid_position.y 
	
func _on_attack_pressed() -> void:
	#debug function
	combo.append("attack")

func _on_play_hand_pressed() -> void:
	#maybe put this part in its own function when programming turn cycle
	var player = player_1
	var opponent = player_2
	
	combo = combo_box_1.container.get_children()
	for move in combo:
		print(combo)
		match move.move_index:
			"attack":
				opponent.attributes.h_p -= 10.0
			"move_back":
				player_1.attributes.grid_position.x -= 1
		await get_tree().create_timer(1).timeout
	combo.clear()
	
	
func character_move() -> void:
	pass
	
func character_attack() -> void:
	pass

func character_block() -> void:
	pass

func character_grab() -> void:
	pass
