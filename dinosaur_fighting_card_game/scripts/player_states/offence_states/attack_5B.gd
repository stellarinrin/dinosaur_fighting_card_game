extends PlayerState
class_name Attack5B

@export var idle_state : PlayerState
@export var attack_2C_state : PlayerState

func enter() -> void:
	if parent.is_current_turn:
		super()
	frame_count = 0

func exit() -> void:
	pass
	
func process_input(event: InputEvent) -> PlayerState:
	if frame_count > cancel_frame:
		if event.is_action_pressed('2C'):
			return attack_2C_state
	return null
func process_frame(_delta: float) -> PlayerState:
	frame_count += 1
	return null
func process_physics(delta: float) -> PlayerState:
	return null

func on_animation_finished(anim_name: StringName) -> PlayerState:
	if anim_name == "5B":
		return idle_state
	return null
