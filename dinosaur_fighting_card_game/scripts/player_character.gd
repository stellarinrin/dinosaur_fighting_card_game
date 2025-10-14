extends Node2D
@export var isPlayer : bool
func _ready() -> void:
	Events.parsed_card.connect(_on_parsed_card.bind())
	
func _on_parsed_card(index: String, _attributes: MoveAttributes, player: bool) -> void:
	if player != isPlayer: # Don't play animations if not active character
		return
	match index:
		"5B":
			%PlayerAnimation.play(index)
		"2B":
			%PlayerAnimation.play(index)


func _on_player_animation_finished(_anim_name: StringName) -> void:
	Events.animation_finished.emit()
