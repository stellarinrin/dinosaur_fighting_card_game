extends PlayerState
class_name Attack5B

@export var idle_state : PlayerState

func enter() -> void:
	parent.animations.play(animation_name)
	parent.isAnimationFinished = false

func exit() -> void:
	pass
	
func process_frame(_delta: float) -> PlayerState:
	#on hit, return hit_state
	if parent.isAnimationFinished:
		return idle_state
	return null

func process_physics(delta: float) -> PlayerState:
	#parent.velocity.y += gravity * delta
	#parent.move_and_slide()
	return null
