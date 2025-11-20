extends PlayerState
class_name BlockStanding
signal on_block

@export var idle_state : PlayerState
@export var go_state : PlayerState
@export var jump_state : PlayerState

@export var attack_5B_state : PlayerState
@export var attack_2C_state : PlayerState

@export var block_crouching_state : PlayerState
@export var block_standing_state : PlayerState
@export var hit_state : PlayerState

func enter() -> void:
	super()
	on_block.emit()
	Events.cancellable.emit()

func exit() -> void:
	parent.animations.play('RESET')
	parent.animations.seek(0)
	frame_count = 0
	
func process_input(event: InputEvent) -> PlayerState:
	if event.is_action_pressed('block standing'):
		return idle_state
	if event.is_action_pressed('dash'):
		return go_state
	if event.is_action_pressed('jump'):
		return jump_state
	if event.is_action_pressed('5B'):
		return attack_5B_state
	if event.is_action_pressed('2C'):
		return attack_2C_state
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
		"block_crouching":
			return block_crouching_state
		"block_standing":
			return block_standing_state
	return null
	
func on_hurtbox_damaged(damage: float) -> PlayerState:
	return hit_state
