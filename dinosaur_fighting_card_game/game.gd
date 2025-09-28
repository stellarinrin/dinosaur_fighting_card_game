extends Node2D

# @export var player_character: Character
@onready var game_state_controller := $GameStateController
@onready var combo : Array
@onready var isHandPlayed : bool = false
@onready var isAnimationFinished : bool = true

func _ready() -> void:
	# Initialise the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	game_state_controller.init(self)
	Events.animation_finished.connect(_on_animation_finished.bind())

func _process(delta: float) -> void:
	game_state_controller.process_frame(delta)
	
func _on_play_hand_button_down() -> void:
	combo = %ComboBoxContainer.combo_hand
	isHandPlayed = true

func _on_animation_finished() -> void:
	isAnimationFinished = true
