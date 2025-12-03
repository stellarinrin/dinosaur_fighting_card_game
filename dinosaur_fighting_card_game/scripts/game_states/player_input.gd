extends GameState

@export var parse_player_card_state: GameState
@onready var level_canvas := %LevelCanvas
@onready var standing_mid_card = preload("res://scenes/card-standing-mid.tscn")
@onready var crouching_low_card = preload("res://scenes/card-crouching-low.tscn")
@onready var dash_card = preload("res://scenes/card-dash.tscn")

func enter() -> void:
	var standing_mid = standing_mid_card.instantiate()
	level_canvas.add_child(standing_mid)
	standing_mid.position = Vector2(913,826)
	var standing_low = crouching_low_card.instantiate()
	level_canvas.add_child(standing_low)
	standing_low.position = Vector2(913,826)
	var dash = dash_card.instantiate()
	level_canvas.add_child(dash)
	dash.position = Vector2(678,826)
	var standing_mid2 = standing_mid_card.instantiate()
	level_canvas.add_child(standing_mid2)
	standing_mid2.position = Vector2(913,900)
	var standing_low2 = crouching_low_card.instantiate()
	level_canvas.add_child(standing_low2)
	standing_low2.position = Vector2(913,900)

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	if parent.is_hand_played:
		parent.combo = %PlayerComboBoxContainer.combo_hand
		return parse_player_card_state
	return null
