extends PlayerState
class_name Landing

@export var idle_state : PlayerState
@export var hit_state : PlayerState

func enter() -> void:
	super()

func process_physics(delta: float) -> PlayerState:
	parent.velocity.y += gravity * delta
	if parent.is_on_floor():
		return idle_state
	parent.move_and_slide()
	return null
