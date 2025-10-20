extends PlayerState
class_name Idle


@export var go_state : PlayerState
@export var jump_state : PlayerState

@export var attack_5B_state : PlayerState
@export var attack_2C_state : PlayerState

@export var block_standing_state: PlayerState
@export var block_crouching_state : PlayerState
@export var hit_state : PlayerState

func enter() -> void:
	super()
	parent.velocity.x = 0

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

func process_physics(delta: float) -> PlayerState:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	return null
	
func on_hurtbox_damaged(damage: float) -> PlayerState:
	return hit_state
