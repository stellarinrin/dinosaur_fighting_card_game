extends PlayerState
class_name Dash

@export var stopping_state : PlayerState
@export var dash_state : PlayerState
@export var dash_back_state : PlayerState
@export var jump_state : PlayerState
@export var jump_forward_state : PlayerState
@export var jump_backward_state : PlayerState

@export var attack_5B_state : PlayerState
@export var attack_2C_state : PlayerState

@export var hit_state : PlayerState
func enter() -> void:
	super()
	frame_count = 0

func process_frame(delta: float) -> PlayerState:
	frame_count += 1
	if frame_count == cancel_frame:
		return stopping_state
	return null
func process_input(event: InputEvent) -> PlayerState:
	if event.is_action_pressed('jump'):
		return jump_state
	if event.is_action_pressed('dash'):
		return dash_state
	if event.is_action_pressed('5B'):
		return attack_5B_state
	if event.is_action_pressed('2C'):
		return attack_2C_state

	#if Input.is_action_just_pressed('hit'):
		#return hit_state
	return null

func process_physics(delta: float) -> PlayerState:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	return null
