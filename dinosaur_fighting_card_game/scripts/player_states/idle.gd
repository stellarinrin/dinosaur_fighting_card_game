extends PlayerState
class_name Idle

@export var attack_5B_state : PlayerState
@export var attack_2B_state : PlayerState
@export var dash_state : PlayerState
@export var jump_state : PlayerState
@export var ground_block_state : PlayerState
@export var stand_block_state: PlayerState
@export var hit_state : PlayerState

func enter() -> void:
	pass

func exit() -> void:
	pass

func _on_parsed_card(index: String, attributes: MoveAttributes, player: bool) -> PlayerState:
	if not attributes.is_grounded:
		return null
	match index:
		"dash":
			return dash_state
		"jump":
			return jump_state
		"ground_block":
			return ground_block_state
		"stand_block":
			return stand_block_state
		"5B":
			return attack_5B_state
		"2B":
			return attack_2B_state
	return null
	
func process_frame(delta: float) -> PlayerState:
	#on hit, return hit_state
	return null

func process_physics(delta: float) -> PlayerState:
	#parent.velocity.y += gravity * delta
	#parent.move_and_slide()
	return null
