extends CharacterBody2D

@export var is_current_turn : bool = true
@export var is_facing_left : bool = false
@onready var animations = $AnimationPlayer

@onready var state_machine = $PlayerStateController

func _ready() -> void:
	# Initialize the state machine, passing a reference of the player to the states,
	# that way they can move and react accordingly
	state_machine.init(self)
func _unhandled_input(event: InputEvent) -> void:
	if is_current_turn:
		state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	state_machine.on_animation_finished(anim_name)

func _on_hurtbox_damaged(damage: float) -> void:
	state_machine.on_hurtbox_damaged(damage)
