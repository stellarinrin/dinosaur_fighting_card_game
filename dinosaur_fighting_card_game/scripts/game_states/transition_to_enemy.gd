extends GameState

@export var enemy_input_state : GameState
@onready var animation_name = "enemy_notification"
@onready var is_animation_playing : bool = false

func enter() -> void:
	parent.hud_animations.play(animation_name)
	
func exit() -> void:
	pass

func process_frame(_delta: float) -> GameState:
	return null
	
func on_hud_animation_finished(anim_name: StringName) -> GameState:
	if not (anim_name == animation_name):
		return null
	if is_animation_playing:
		Events.switch_turn.emit()
		is_animation_playing = false
		return enemy_input_state
	else:
		parent.hud_animations.play_backwards(animation_name)
		is_animation_playing = true
		return null
