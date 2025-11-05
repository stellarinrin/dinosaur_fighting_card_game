extends GameState

@export var player_input_state : GameState
@onready var animation_name = "player_notification"
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
		parent.is_hand_played = false
		is_animation_playing = false
		return player_input_state
	else:
		parent.hud_animations.play_backwards(animation_name)
		is_animation_playing = true
		return null

	
