extends PlayerState
class_name Attack2C

@export var idle_state : PlayerState
@export var attack_5B_state : PlayerState

func enter() -> void:
	if parent.is_current_turn:
		super()
	frame_count = 0

func exit() -> void:
	pass
	
func process_input(event: InputEvent) -> PlayerState:
	if frame_count > cancel_frame:
		if event.is_action_pressed('5B'):
			return attack_5B_state
	return null
	
func parse_card(move_id: String) -> PlayerState:
	match move_id:
		"5B":
			return attack_5B_state
	Events.cancellable.emit()
	return null
		
func process_frame(_delta: float) -> PlayerState:
	frame_count += 1
	if frame_count == cancel_frame:
		Events.cancellable.emit()
	return null
	
func process_physics(delta: float) -> PlayerState:
	return null

func on_animation_finished(anim_name: StringName) -> PlayerState:
	if anim_name == "2C":
		return idle_state
	return null
