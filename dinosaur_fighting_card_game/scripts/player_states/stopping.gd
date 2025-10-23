extends PlayerState
class_name Stopping

@export var idle_state : PlayerState
@export var go_state : PlayerState
@export var jump_state : PlayerState
@export var jump_forward_state : PlayerState
@export var jump_backward_state : PlayerState

@export var attack_5B_state : PlayerState
@export var attack_2C_state : PlayerState

@export var block_standing_state: PlayerState
@export var block_crouching_state : PlayerState
@export var hit_state : PlayerState


func enter() -> void:
	if parent.is_current_turn:
		super()
		Events.cancellable.emit()
	
func process_input(event: InputEvent) -> PlayerState:
	if event.is_action_pressed('jump') and parent.is_on_floor():
		return jump_state
	if event.is_action_pressed('dash'):
		return go_state
	if event.is_action_pressed('5B'):
		return attack_5B_state
	if event.is_action_pressed('2C'):
		return attack_2C_state
	if event.is_action_pressed('block standing'):
		return block_standing_state
	if event.is_action_pressed('block crouching'):
		return block_crouching_state
	return null
	
func parse_card(move_id: String) -> PlayerState:
	match move_id:
		"jump":
			if parent.is_on_floor():
				return jump_state
		"dash":
			return go_state
		"5B":
			return attack_5B_state
		"2C":
			return attack_2C_state
		"block_standing":
			return block_standing_state
		"block_crouching":
			return block_crouching_state
	return null
	
func process_physics(delta: float) -> PlayerState:
	parent.velocity.y += gravity * delta
	if parent.is_facing_left :
		parent.velocity.x += 250
		if parent.velocity.x > 0:
			parent.velocity.x = 0		
	else :
		parent.velocity.x -= 250
		if parent.velocity.x < 0:
			parent.velocity.x = 0
	parent.move_and_slide()
	return null

func on_animation_finished(anim_name: StringName) -> PlayerState:
	return idle_state
