extends PlayerState
class_name Airborne

@export var landing_state : PlayerState

@export var attack_jB_state : PlayerState

@export var block_airborne : PlayerState
@export var hit_state : PlayerState


func enter() -> void:
	super()

func process_physics(delta: float) -> PlayerState:
	parent.velocity.y += gravity * delta
	if parent.is_on_floor():
		return landing_state
	parent.move_and_slide()
	return null
