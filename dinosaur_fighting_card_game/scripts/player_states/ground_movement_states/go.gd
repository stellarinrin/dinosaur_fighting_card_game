extends PlayerState
class_name Go

@export var dash_state : PlayerState
@export var dash_back_state : PlayerState

@export var jump_state : PlayerState
@export var jump_forward_state : PlayerState
@export var jump_backward_state : PlayerState

@export var attack_5B_state : PlayerState
@export var attack_2C_state : PlayerState

@export var hit_state : PlayerState


func enter() -> void:
	if parent.is_current_turn:
		super()
	frame_count = 0
	if parent.is_facing_left:
		parent.velocity.x = -3000
		return
	parent.velocity.x = 3000
	
func process_frame(_delta: float) -> PlayerState:
	frame_count += 1
	if frame_count == cancel_frame:
		return dash_state
	return null	
func process_input(event: InputEvent) -> PlayerState:
	if event.is_action_pressed('jump'):
		return jump_state
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

func on_animation_finished(anim_name: StringName) -> PlayerState:
	if anim_name == "dash_start":
		return dash_state
	return null
