class_name GameController extends Node2D

# @export var player_character: Character
@onready var game_state_controller := $GameStateController
@onready var combo : Array
@onready var isHandPlayed : bool = false
@onready var isAnimationFinished : bool = true
@onready var standing_mid_card = preload("res://scenes/card-standing-mid.tscn")
@onready var crouching_low_card = preload("res://scenes/card-crouching-low.tscn")


func _ready() -> void:
	# Initialise the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	Global.game_controller = self
	game_state_controller.init(self)
	Events.animation_finished.connect(_on_animation_finished.bind())
	Events.quit_application.connect(_on_application_quit.bind())

func _process(delta: float) -> void:
	game_state_controller.process_frame(delta)
	
func _on_play_hand_button_down() -> void:
	combo = %ComboBoxContainer.combo_hand
	isHandPlayed = true

func _on_animation_finished() -> void:
	isAnimationFinished = true


func _on_add_mid_card_button_down() -> void:
	var instance = standing_mid_card.instantiate()
	$Level.add_child(instance)
	instance.position = Vector2(797,493)

func _on_add_low_card_button_down() -> void:
	var instance = crouching_low_card.instantiate()
	$Level.add_child(instance)
	instance.position = Vector2(797,493)

func _on_application_quit() -> void:
	get_tree().quit(0)
