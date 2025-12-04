extends GameState

@export var parse_player_card_state: GameState
@onready var level_canvas := %LevelCanvas
@onready var standing_mid_card = preload("res://scenes/card-standing-mid.tscn")
@onready var crouching_low_card = preload("res://scenes/card-crouching-low.tscn")
@onready var dash_card = preload("res://scenes/card-dash.tscn")
@onready var dash_back_card = preload("res://scenes/card-dash_back.tscn")

func enter() -> void:
	var dash = dash_card.instantiate()
	level_canvas.add_child(dash)
	dash.position = Vector2(823,889)
	var dash_back = dash_back_card.instantiate()
	level_canvas.add_child(dash_back)
	dash_back.position = Vector2(660,889)
	var standing_mid = standing_mid_card.instantiate()
	level_canvas.add_child(standing_mid)
	standing_mid.position = Vector2(987,889)
	var standing_low = crouching_low_card.instantiate()
	level_canvas.add_child(standing_low)
	standing_low.position = Vector2(1140,889)

	var dash2 = dash_card.instantiate()
	level_canvas.add_child(dash2)
	dash2.position = Vector2(823,889)
	var dash_back2 = dash_back_card.instantiate()
	level_canvas.add_child(dash_back2)
	dash_back2.position = Vector2(660,889)
	var standing_mid2 = standing_mid_card.instantiate()
	level_canvas.add_child(standing_mid2)
	standing_mid2.position = Vector2(987,889)
	var standing_low2 = crouching_low_card.instantiate()
	level_canvas.add_child(standing_low2)
	standing_low2.position = Vector2(1140,889)

func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	if parent.is_hand_played:
		parent.combo = %PlayerComboBoxContainer.combo_hand
		return parse_player_card_state
	return null
