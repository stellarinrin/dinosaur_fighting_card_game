extends CharacterBody2D

@export var max_health : float = 11700
@export var is_current_turn : bool = true
@export var is_facing_left : bool = false
@onready var animations = $AnimationPlayer

@onready var state_machine = $PlayerStateController

var current_health : float

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	current_health = max_health
	state_machine.init(self)
func _unhandled_input(event: InputEvent) -> void:
	if is_current_turn:
		state_machine.process_input(event)
		
func _on_card_play(move_id: String) -> void:
	if is_current_turn:
		state_machine.parse_card(move_id)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	state_machine.on_animation_finished(anim_name)

func _on_hurtbox_damaged(damage: float) -> void:
	current_health -= damage
	current_health = clampf(current_health, 0, max_health)
	state_machine.on_hurtbox_damaged(damage)

func _on_button_button_down() -> void:
	if is_current_turn:
		is_current_turn = false
	else:
		is_current_turn = true
