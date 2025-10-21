extends PlayerState
class_name Jump

@export var airborne_state : PlayerState

@export var attack_jB_state : PlayerState

@export var block_airborne : PlayerState
@export var hit_state : PlayerState

@export var jump_force: float = 700.0

func enter() -> void:
	if parent.is_current_turn:
		super()
	parent.velocity.x = 0
	parent.velocity.y = -jump_force

func process_physics(delta: float) -> PlayerState:
	parent.velocity.y += gravity * delta
	if parent.velocity.y > 600:
		return airborne_state
	parent.move_and_slide()
	return null
