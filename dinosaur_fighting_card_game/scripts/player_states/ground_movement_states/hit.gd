extends PlayerState
class_name Hit

@export var idle_state : PlayerState
@export var hit_state : PlayerState

func enter() -> void:
	super()
	
func on_animation_finished(anim_name: StringName) -> PlayerState:
	if anim_name == animation_name:
		return idle_state
	return null

func on_hurtbox_damaged(damage: float) -> PlayerState:
	return hit_state
