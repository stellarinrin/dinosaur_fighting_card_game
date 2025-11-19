extends GameState

@export var parse_enemy_card_state: GameState
@export var frames_before_enemy_play : int
@onready var standing_block_card = preload("res://scenes/card-standing-block.tscn")
@onready var standing_mid_card = preload("res://scenes/card-standing-mid.tscn")

func enter() -> void:
	super()
	var stand_block = standing_block_card.instantiate()

	%EnemyComboBoxContainer.add_child(stand_block)

	

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	frame_count += 1
	if frame_count == frames_before_enemy_play:
		parent.combo = %EnemyComboBoxContainer.get_children()
		return parse_enemy_card_state
	return null
