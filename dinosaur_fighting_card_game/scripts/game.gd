extends Node2D

@onready var game_state_controller := $GameStateController
@onready var level_canvas := $LevelCanvas
@onready var combo : Array
@onready var is_hand_played : bool = false
@onready var is_enemy_turn : bool = true
@onready var standing_mid_card = preload("res://scenes/card-standing-mid.tscn")
@onready var crouching_low_card = preload("res://scenes/card-crouching-low.tscn")


func _ready() -> void:
	# Initialise the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	game_state_controller.init(self)

func _process(delta: float) -> void:
	game_state_controller.process_frame(delta)
	
func _on_play_hand_button_down() -> void:
	is_hand_played = true

func _on_add_mid_card_button_down() -> void:
	var instance = standing_mid_card.instantiate()
	level_canvas.add_child(instance)
	instance.position = Vector2(797,493)

func _on_add_low_card_button_down() -> void:
	var instance = crouching_low_card.instantiate()
	level_canvas.add_child(instance)
	instance.position = Vector2(797,493)
